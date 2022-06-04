//
//  CharacterService.swift
//  RickAndMorty
//
//  Created by Pavel Epaneshnikov on 4/6/22.
//

import Foundation

class CharacterService {
    private let baseURL = URL(string: "https://rickandmortyapi.com/api/character/")
    private var nextPageURL: URL?
    
    func getAllCharacters(completion: @escaping (([Character]?) -> Void)) {
        guard let url = baseURL else {
            completion(nil)
            return
        }
        
        getAllCharacters(url: url, completion: completion)
    }
    
    func getCharactersFromNextPage(completion: @escaping (([Character]?) -> Void)) {
        guard let url = nextPageURL else {
            completion(nil)
            return
        }
        getAllCharacters(url: url, completion: completion)
    }
    
    private func getAllCharacters(url: URL, completion: @escaping (([Character]?) -> Void)) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let page = try? JSONDecoder().decode(Page<Character>.self, from: data)
            self.nextPageURL = URL(string: (page?.info.next ?? ""))
            completion(page?.results)
            
        }
    }
//    func getAllCharacters(completion: @escaping (([Character]?) -> Void)) {
//        guard let url = baseURL else { completion(nil)
//            return
//        }
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if error != nil {
//                print(error!.localizedDescription)
//            } else {
//                guard let responseData = data else { return }
//                let page = try? JSONDecoder().decode(Page<Character>.self, from: responseData)
//                completion(page?.results ?? [])
//            }
//        }.resume()
//    }
//
//    func getCharactersFromNextPage(completion: @escaping (([Character]?) -> Void)) {
//
//    }
}
