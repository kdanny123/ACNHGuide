//
//  FossilVM.swift
//  ACNHGuide
//

import Foundation


class FossilVM: ObservableObject {
    @Published var fossil = [Fossil]()
    
    
    init() {
        loadData()
    }
    
    func loadData() {
        guard let url = URL(string: "https://acnhapi.com/v1a/fossils") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode([Fossil].self, from: data)
                DispatchQueue.main.async {
                    self.fossil = (decodedData)
                }
            } catch {
                print("error: \(error)")
            }
        }.resume()
    }
    
}
