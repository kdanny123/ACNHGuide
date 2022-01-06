//
//  FishRow.swift
//  ACNHGuide

import SwiftUI

struct FishDetail: View {
    let fish: Fish
        
    var body: some View {
                
        ZStack {
            Color.init(red: 110/255, green: 154/255, blue: 169/255)
                .opacity(0.75)
                .ignoresSafeArea()
            VStack {
                VStack(alignment: .center) {
                    AsyncImage(
                        url: URL(string: fish.imageURI),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 200, height: 200)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    Text(fish.catchPhrase)
                        .italic()
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                .navigationTitle((fish.name.nameUSen).capitalized)
                .navigationBarTitleDisplayMode(.inline)
                                            
                VStack {
                    ScrollView {
                        Section(header: Text("Details")
                                    .font(Font.custom("FinkHeavy", size: 30))
                                    .foregroundColor(.secondary)) {
                            Group {
                                HStack{
                                    Text("Shadow:")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text(fish.shadow)
                                }                                                                
                                HStack {
                                    Text("Rarity")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text(fish.availability.rarity.rawValue)
                                }
                                
                                
                                HStack {
                                    Text("Price")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text("\(fish.price) Bells")
                                }
                                
                                
                                HStack {
                                    Text("Location")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text(fish.availability.location.rawValue)
                                }
                                
                                HStack {
                                    Text("Is available all year?")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text(String(fish.availability.isAllYear ? "Yes":"No"))
                                }
                                
                                HStack {
                                    Text("Is available all day?")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text(String(fish.availability.isAllDay ? "Yes":"No"))
                                }

                                
                                HStack {
                                    
                                    Text("Time of Day")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text(fish.availability.time.rawValue)
                                    
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 10){
                        ScrollView {
                            Section(header: Text("Description")
                                        .font(Font.custom("FinkHeavy", size: 30))
                                        .foregroundColor(.secondary)) {
                        Text(fish.museumPhrase)
                            }
                        }
                    }
                    .padding()
                }
                
                Spacer()
            }
        }
    }
}


struct FishRow_Previews: PreviewProvider {
    static var previews: some View {
        FishDetail(fish: Fish.previewData[15])
    }
}
