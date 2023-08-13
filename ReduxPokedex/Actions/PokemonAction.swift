//
//  PokemonAction.swift
//  ReduxPokedex
//
//  Created by Gabriel Zawalski on 26/02/23.
//

import Foundation

enum PokemonAction {
    case fetch
    case fetchCompletion(data: [PokemonModel])
    case fetchError(error: Error?)
}
