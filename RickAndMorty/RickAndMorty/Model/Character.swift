//
//  Character.swift
//  RickAndMorty
//
//  Created by Pavel Epaneshnikov on 4/6/22.
//

import Foundation

struct Character {
    let name: String
    let image: String
    let status: String
    let gender: String
}

extension Character: Decodable {}
