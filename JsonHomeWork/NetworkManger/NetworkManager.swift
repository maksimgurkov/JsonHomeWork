//
//  NetworkManager.swift
//  JsonHomeWork
//
//  Created by Максим Гурков on 19.04.2022.
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
        
    func fetchData(from url: String?, with completion: @escaping(RickAndMorty) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error")
                return
            }
            
            do {
                
                let rickAndMorty = try JSONDecoder().decode(RickAndMorty.self, from: data)
                DispatchQueue.main.async {
                    completion(rickAndMorty)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

class ImageManager {
    static let shered = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: String?) -> Data? {
        guard let imageUrl = URL(string: url ?? "") else { return nil }
        return try? Data(contentsOf: imageUrl)
    }
}
