//
//  PokemonState.swift
//  ReduxPokedex
//
//  Created by Gabriel Zawalski on 26/02/23.
//

import Foundation

enum PokemonState {
    case fetching
    case error(Error?)
    case loaded([PokemonModel])
}
