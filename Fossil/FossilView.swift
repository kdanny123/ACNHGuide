//
//  FossilView.swift
//  ACNHGuide
//
//

import SwiftUI

struct FossilView: View {
    @ObservedObject var fossilManager = FossilVM()
    @State private var searchText = ""
    
    var searchResults: [Fossil] {
        if searchText.isEmpty {
            return fossilManager.fossil
        }
        return fossilManager.fossil.filter { $0.name.nameUSen.localizedCaseInsensitiveContains(searchText) }
    }
    
    var body: some View {
        ZStack {
            Color.init(red: 128/255, green: 128/255, blue: 128/255)
                
            List {
                
                    ForEach(searchResults) { fossil in
                        FossilRow(fossil: fossil)
                            .listRowBackground(Color.init(red: 128/255, green: 128/255, blue: 128/255))

                    }
                

            }
            .listStyle(PlainListStyle())

            .searchable(text: $searchText,
                        placement: .navigationBarDrawer(displayMode: .always)
                        ,prompt: "Search Fossils")
            
            

            
        
            
        }
        
        
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(18)
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 0)
    }
}



struct FossilView_Previews: PreviewProvider {
    static var previews: some View {
        FossilView()
    }
}
