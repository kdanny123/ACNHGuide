//
//  VillagerRow.swift
//  ACNHGuide
//
//

import SwiftUI

struct VillagerRow: View {
    let villager: Villager
    
    var body: some View {
        
        HStack {
            
            AsyncImage(
                url: URL(string: villager.imageURI),
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 125)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 7)
                        .padding(.all, 20)
                },
                placeholder: {
                    ProgressView()
                }
            )

            VStack {
                Text(villager.name.nameUSen)
                    .font(.custom("default", size: 35))
                Text(villager.gender.rawValue)
                    .font(.custom("default", size:20))
                    .foregroundColor(.secondary)
            }
            
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 152/255, green: 232/255, blue: 118/255))
        .modifier(CardModifier())
        .padding(.all, 20)

    }
}

struct VillagerRow_Previews: PreviewProvider {
    static var previews: some View {
        VillagerRow(villager: Villager.previewData[0])
    }
}
