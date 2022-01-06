//
//  VillagerList.swift
//  ACNHGuide
//
//

import SwiftUI

struct VillagerList: View {
    @ObservedObject var villagerManager = VillagerVM()
    //    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State private var searchText = ""
    
    var searchResults: [Villager] {
        if searchText.isEmpty {
            return villagerManager.villager
        }
        return villagerManager.villager.filter { $0.name.nameUSen.localizedCaseInsensitiveContains(searchText) }
    }
    
    var body: some View {
                        
        List {
            ForEach(searchResults) { villager in
                VillagerRow(villager: villager)
            }
        }
        .listStyle(GroupedListStyle())
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Enter villager name" )
    }
}

struct VillagerList_Previews: PreviewProvider {
    static var previews: some View {
        VillagerList()
    }
}
