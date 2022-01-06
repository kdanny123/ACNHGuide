//
//  ContentView.swift
//  ACNHGuide

import SwiftUI


//let url = URL(string: "https://acnhapi.com/v1a/")

struct ContentView: View {
    let categories = ["Fish", "Sea", "Bugs", "Fossils", "Villagers", "Art", "Items"]
    @State private var action: Int? = 0
    
    
    var body: some View {
        
        NavigationView {
            
            
            
            
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                VStack {
                    Image("splash")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 400, alignment: .top)
                    
                    NavigationLink(destination: FishView(), tag: 1, selection: $action) {
                    }
                    NavigationLink(destination: SeaView(), tag: 2, selection: $action) {
                    }
                    
                    NavigationLink(destination: BugView(), tag: 3, selection: $action) {
                        
                        
                    }
                    
                    NavigationLink(destination: FossilView(), tag: 4, selection: $action) {
                        
                        
                    }
                    NavigationLink(destination: VillagerList(), tag: 5, selection: $action) {
                        
                        
                    }
                    NavigationLink(destination: Text("artview()"), tag: 6, selection: $action) {
                        
                        
                    }
                    NavigationLink(destination: Text("itemsview()"), tag: 7, selection: $action) {
                        
                        
                    }
                    
                    
                    
                    
                    
                    
                    
                    Group {
                        Text("Fish")
                            .onTapGesture {
                                self.action = 1
                            }
                        Text("Sea")
                            .onTapGesture {
                                self.action = 2
                            }
                        Text("Bugs")
                            .onTapGesture {
                                self.action = 3
                            }
                        Text("Fossils")
                            .onTapGesture {
                                self.action = 4
                            }
                        Text("Villagers")
                            .onTapGesture {
                                self.action = 5
                            }
                        Text("Art")
                            .onTapGesture {
                                self.action = 6
                            }
                        Text("Items")
                            .onTapGesture {
                                self.action = 7                                                    
                        }
                    }
                    .font(Font.custom("FinkHeavy", size: 55))
                    .frame(width: UIScreen.main.bounds.size.width-50, height: 55)
                    .scaledToFill()
                    .clipped()
                    Spacer()
                }
                .navigationTitle("")
                .navigationBarHidden(true)
            }
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
