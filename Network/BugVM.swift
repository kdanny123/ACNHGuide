//
//  BugVM.swift
//  ACNHGuide
//

import Foundation

class BugVM: ObservableObject {
    @Published var bug = [Bug]()

    
    init() {
          loadData()
      }
      
      func loadData() {
          guard let url = URL(string: "https://acnhapi.com/v1a/bugs") else { return }
          URLSession.shared.dataTask(with: url) { (data, _, error) in
              guard let data = data else { return }
              do {
                  let decodedData = try JSONDecoder().decode([Bug].self, from: data)
                  DispatchQueue.main.async {
                      self.bug = (decodedData)
                  }
              } catch {
                  print("error: \(error)")
              }
          }.resume()
      }
    
    
}
