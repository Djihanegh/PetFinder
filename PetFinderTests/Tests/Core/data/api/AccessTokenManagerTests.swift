//
//  AccessTokenManagerTests.swift
//  PetFinderTests
//
//  Created by MAC on 9/9/2025.
//

import XCTest
@testable import PetFinder

class AccessTokenManagerTests: XCTestCase {
    var accessTokenManager: AccessTokenManagerProtocol?
    var requestManager: RequestManagerMock?
    
    override func setUp() {
        super.setUp()
        guard let userDefaults = UserDefaults(suiteName: #file) else { return }
        userDefaults.removePersistentDomain(forName: #file)
        accessTokenManager = AccessTokenManager(userDefaults: userDefaults)
        guard let accessTokenManager = accessTokenManager else { return }
        requestManager = RequestManagerMock(apiManager: APIManagerMock(), accessTokenManager: accessTokenManager)
    }
    
    func testRequestToken() async throws {
        guard let token = try await requestManager?.requestAccessToken() else { return }
        XCTAssertFalse(token.isEmpty)
    }
    
    func testCachedToken() async throws {
        let token = try await requestManager?.requestAccessToken()
        let sameToken = accessTokenManager?.fetchToken()
        XCTAssertEqual(token, sameToken)
    }
    
    func testRequestNewToken() async throws {
        guard let token = try await requestManager?.requestAccessToken() else { return }
        guard let accessTokenManager = accessTokenManager else { return }
        XCTAssertTrue(accessTokenManager.isTokenValid())
        let exp = expectation(description: "Test token validity after 10 seconds")
        
        
        // Schedule token expiration after 10s
        Task {
            try await Task.sleep(nanoseconds: 10 * 1_000_000_000) // 10 seconds
            exp.fulfill()
        }
        
        // ⬅️ New Swift 6 async wait
        await fulfillment(of: [exp], timeout: 11)
        XCTAssertFalse(accessTokenManager.isTokenValid())
        let newToken = try await requestManager?.requestAccessToken()
        XCTAssertTrue(accessTokenManager.isTokenValid())
        XCTAssertNotEqual(token, newToken)
        
        
    }
    
    func testRefreshToken() async throws {
        guard let token = try await requestManager?.requestAccessToken() else { return }
        let randomToken = AccessTokenTestHelper.randomAPIToken()
        guard let accessTokenManager = accessTokenManager else { return }
        try accessTokenManager.refreshWith(apiToken: randomToken)
        XCTAssertNotEqual(token, accessTokenManager.fetchToken())
        XCTAssertEqual(randomToken.bearerAccessToken, accessTokenManager.fetchToken())
    }
}
