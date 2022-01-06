//
//  FishVM.swift
//  ACNHGuide
//

import Foundation

class FishVM: ObservableObject {
    @Published var fish = [Fish]()

    
    init() {
          loadData()
      }
      
      func loadData() {
          guard let url = URL(string: "https://acnhapi.com/v1a/fish") else { return }
          URLSession.shared.dataTask(with: url) { (data, _, error) in
              guard let data = data else { return }
              do {
                  let decodedData = try JSONDecoder().decode([Fish].self, from: data)
                  DispatchQueue.main.async {
                      self.fish = (decodedData)
//                      print(self.fish)
                  }
              } catch {
                  print("error: \(error)")
              }
          }.resume()
      }
    
    
}
