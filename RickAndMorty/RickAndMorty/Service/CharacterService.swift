//
//  CharacterService.swift
//  RickAndMorty
//
//  Created by Pavel Epaneshnikov on 4/6/22.
//

import Foundation

class CharacterService {
    private let baseURL = URL(string: "https://rickandmortyapi.com/api/character/")
    
    func getAllCharacters(completion: @escaping (([Character]?) -> Void)) {
        guard let url = baseURL else { completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                guard let responseData = data else { return }
                let page = try? JSONDecoder().decode(Page<Character>.self, from: responseData)
                completion(page?.results ?? [])
            }
        }.resume()
    }
}
