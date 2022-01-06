//
//  BugDetail.swift
//  ACNHGuide


import SwiftUI

struct BugDetail: View {
    let bug: Bug
    var body: some View {
        ZStack {
            Color.init(red: 242/255, green: 233/255, blue: 198/255)
                .opacity(0.75)
                .ignoresSafeArea()
            VStack {
                VStack(alignment: .center) {
                    AsyncImage(
                        url: URL(string: bug.imageURI),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 200, height: 200)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    Text(bug.catchPhrase)
                        .italic()
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                .navigationTitle((bug.name.nameUSen).capitalized)
                .navigationBarTitleDisplayMode(.inline)
                                            
                VStack {
                    ScrollView {
                        Section(header: Text("Details")
                                    .font(Font.custom("FinkHeavy", size: 30))
                                    .foregroundColor(Color.init(red: 100/255, green: 49/255, blue: 15/255))) {
                            Group {
                             
                                                                                                
                                HStack {
                                    Text("Price")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text("\(bug.price) Bells")
                                }
                                
                                HStack {
                                    Text("Rarity")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text(bug.availability.rarity.rawValue)
                                }

                                
                                                            
                                
                                HStack {
                                    Text("Is available all year?")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text(String(bug.availability.isAllYear ? "Yes":"No"))
                                }
                                
                                HStack {
                                    Text("Is available all day?")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text(String(bug.availability.isAllDay ? "Yes":"No"))
                                }

                                
                                HStack {
                                    
                                    Text("Time of Day")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text(bug.availability.time.rawValue)
                                    
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 10){
                        ScrollView {
                            Section(header: Text("Description")
                                        .font(Font.custom("FinkHeavy", size: 30))
                                        .foregroundColor((Color.init(red: 100/255, green: 49/255, blue: 15/255)))) {
                        Text(bug.museumPhrase)
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

struct BugDetail_Previews: PreviewProvider {
    static var previews: some View {
        BugDetail(bug: .previewData[0])
    }
}
