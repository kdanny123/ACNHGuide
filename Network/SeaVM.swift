//
//  SeaVM.swift
//  ACNHGuide
//


import Foundation

class SeaVM: ObservableObject {
    @Published var sea = [Sea]()

    
    init() {
          loadData()
      }
      
      func loadData() {
          guard let url = URL(string: "https://acnhapi.com/v1a/sea") else { return }
          URLSession.shared.dataTask(with: url) { (data, _, error) in
              guard let data = data else { return }
              do {
                  let decodedData = try JSONDecoder().decode([Sea].self, from: data)
                  DispatchQueue.main.async {
                      self.sea = (decodedData)
                  }
              } catch {
                  print("error: \(error)")
              }
          }.resume()
      }
    
    
}
