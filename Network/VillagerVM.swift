//
//  VillagerVM.swift
//  ACNHGuide
//
//

import Foundation

class VillagerVM: ObservableObject {
    @Published var villager = [Villager]()
    
    
    init() {
        loadData()
    }
    
    func loadData() {
        guard let url = URL(string: "https://acnhapi.com/v1a/villagers") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode([Villager].self, from: data)
                DispatchQueue.main.async {
                    self.villager = (decodedData)
                }
            } catch {
                print("error: \(error)")
            }
        }.resume()
    }
    
}
