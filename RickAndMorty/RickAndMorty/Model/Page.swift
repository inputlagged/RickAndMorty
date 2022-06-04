//
//  Character.swift
//  RickAndMorty
//
//  Created by Pavel Epaneshnikov on 4/6/22.
//

import Foundation

struct Page<T: Decodable> {
    struct Info: Decodable {
        let count: Int
        let pages: Int
        let next: String
    }

    let info: Info
    let results: [T]
}

extension Page: Decodable {}


