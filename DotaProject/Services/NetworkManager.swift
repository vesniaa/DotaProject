//
//  NetworkManager.swift
//  DotaProject
//
//  Created by Евгения Аникина on 11.04.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String?, with completion: @escaping(Hero) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let hero = try JSONDecoder().decode(Hero.self, from: data)
                DispatchQueue.main.async {
                    completion(hero)
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
}
