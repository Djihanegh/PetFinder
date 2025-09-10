//
//  AnimalsNearYouView.swift
//  PetFinder
//
//  Created by MAC on 9/9/2025.
//

import SwiftUI

struct AnimalsNearYouView: View {
    @SectionedFetchRequest<String, AnimalEntity>(
        sectionIdentifier: \AnimalEntity.animalSpecies,
        sortDescriptors: [
            NSSortDescriptor(keyPath: \AnimalEntity.species, ascending: true),
            NSSortDescriptor(keyPath: \AnimalEntity.timestamp, ascending: true)
        ],
        animation: .default
    ) private var sectionedAnimals: SectionedFetchResults<String, AnimalEntity>
    
    @ObservedObject var viewModel: AnimalsNearYouViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sectionedAnimals) { animals in
                    Section(header: Text(animals.id))  {
                        ForEach (animals) { animal in
                            NavigationLink (destination: AnimalDetailsView()) {
                                AnimalRow(animal: animal)
                            }
                        }
                    }
                    
                }
            }
            .task {
                await viewModel.fetchAnimals()
            }
            .listStyle(.plain)
            .navigationTitle("Animals near you")
            .overlay {
                if viewModel.isLoading {
                    ProgressView("Finding Animals near you...")
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    
    
    @MainActor
    func stopLoading() async {
        viewModel.isLoading = false
    }
}

struct AnimalsNearYouView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalsNearYouView(viewModel: AnimalsNearYouViewModel(animalFetcher: AnimalsFetcherMock(), animalStore: AnimalStoreService(context: CoreDataHelper.previewContext )))
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
