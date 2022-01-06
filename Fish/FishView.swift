//
//  FishView.swift
//  ACNHGuide

import SwiftUI

struct FishView: View {
    
    @ObservedObject var fishManager = FishVM()
    @State private var searchText: String = ""
    
    var searchResults: [Fish] {
        if searchText.isEmpty {
            return fishManager.fish
        }
        return fishManager.fish.filter { $0.name.nameUSen.localizedCaseInsensitiveContains(searchText) }
    }

    
    var body: some View {
        
        List {
            ForEach(searchResults) { fish in
                NavigationLink(destination: FishDetail(fish: fish)){
                    HStack{
                        AsyncImage(
                            url: URL(string: fish.imageURI),
                            content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 100, maxHeight: 100)
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                        Text(fish.name.nameUSen.capitalized)
                            .font(.title)
                    }
                    .padding()
                }
            }
            .listRowBackground(Color.init(red: 110/255, green: 154/255, blue: 169/255))
        }
        .searchable(text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always)
                    ,prompt: "Search Fish")

      
        .navigationTitle("Fish")
        .listStyle(.insetGrouped)
    }
    
}


struct FishView_Previews: PreviewProvider {
    static var previews: some View {
        FishView()
    }
}
