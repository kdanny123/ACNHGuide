//
//  BugView.swift
//  ACNHGuide

import SwiftUI

struct BugView: View {
    
    @ObservedObject var bugManager = BugVM()
    @State private var searchText: String = ""

    var searchResults: [Bug] {
        if searchText.isEmpty {
            return bugManager.bug
        }
        return bugManager.bug.filter { $0.name.nameUSen.localizedCaseInsensitiveContains(searchText) }
    }


    var body: some View {
        
        List {
            ForEach(searchResults) { bug in
                NavigationLink(destination: BugDetail(bug: bug)){
                    HStack{
                        AsyncImage(
                            url: URL(string: bug.imageURI),
                            content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 100, maxHeight: 100)
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                        Text(bug.name.nameUSen.capitalized)
                            .font(.title)
                    }
                    .padding()
                }
            }
            .listRowBackground(Color.init(red: 242/255, green: 233/255, blue: 198/255))
        }
        .searchable(text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always)
                    ,prompt: "Search Bugs")
        
        .navigationTitle("Bugs")
        .listStyle(PlainListStyle())
        
    }
}

struct BugView_Previews: PreviewProvider {
    static var previews: some View {
        BugView()
    }
}
