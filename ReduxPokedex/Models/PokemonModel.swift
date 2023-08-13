//
//  PokemonModel.swift
//  ReduxPokedex
//
//  Created by Gabriel Zawalski on 26/02/23.
//

import Foundation

struct PokemonList: Decodable {
    var results: [PokemonModel]
}

struct PokemonModel: Decodable, Hashable {
    var name: String
    var url: String
}
