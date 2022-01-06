//
//  SeaDetail.swift
//  ACNHGuide

import SwiftUI

struct SeaDetail: View {
    
    let sea: Sea
    var body: some View {
        ZStack {
            Color.init(red: 110/255, green: 154/255, blue: 169/255)
                .opacity(0.75)
                .ignoresSafeArea()
            VStack {
                VStack(alignment: .center) {
                    AsyncImage(
                        url: URL(string: sea.imageURI),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 200, height: 200)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    Text(sea.catchPhrase)
                        .italic()
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                .navigationTitle((sea.name.nameUSen).capitalized)
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
                                    Text(sea.shadow)
                                }
                                                                                                
                                HStack {
                                    Text("Price")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text("\(sea.price) Bells")
                                }
                                
                                HStack {
                                    Text("Speed")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text(sea.speed.rawValue)
                                }

                                
                                                            
                                
                                HStack {
                                    Text("Is available all year?")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text(String(sea.availability.isAllYear ? "Yes":"No"))
                                }
                                
                                HStack {
                                    Text("Is available all day?")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text(String(sea.availability.isAllDay ? "Yes":"No"))
                                }

                                
                                HStack {
                                    
                                    Text("Time of Day")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text(sea.availability.time.rawValue)
                                    
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
                        Text(sea.museumPhrase)
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

struct SeaDetail_Previews: PreviewProvider {
    static var previews: some View {
        SeaDetail(sea: .previewData[0])
    }
}
