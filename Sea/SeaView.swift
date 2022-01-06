//
//  SeaView.swift
//  ACNHGuide


import SwiftUI

struct SeaView: View {
    
    @ObservedObject var seaManager = SeaVM()
    @State private var searchText: String = ""
    
    var searchResults: [Sea] {
        if searchText.isEmpty {
            return seaManager.sea
        }
        return seaManager.sea.filter { $0.name.nameUSen.localizedCaseInsensitiveContains(searchText) }
    }


    var body: some View {

        List {
            ForEach(searchResults) { sea in
                NavigationLink(destination: SeaDetail(sea: sea)){
                    HStack{
                        AsyncImage(
                            url: URL(string: sea.imageURI),
                            content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 100, maxHeight: 100)
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                        Text(sea.name.nameUSen.capitalized)
                            .font(.title)
                    }
                    .padding()
                }
            }
            .listRowBackground(Color.init(red: 110/255, green: 154/255, blue: 169/255))
        }
        .searchable(text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always)
                    ,prompt: "Search Sea Creatures")
        
        .navigationTitle("Sea Creatures")
        .listStyle(.insetGrouped)
        
    }
}

struct SeaView_Previews: PreviewProvider {
    static var previews: some View {
        SeaView()
    }
}
