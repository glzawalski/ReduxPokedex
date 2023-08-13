//
//  PokemonReducer.swift
//  ReduxPokedex
//
//  Created by Gabriel Zawalski on 26/02/23.
//

import Foundation

func pokemonReducer(state: inout PokemonState, action: PokemonAction) {
    switch action {
    case .fetch:
        state = .fetching

    case let .fetchCompletion(data):
        state = .loaded(data)

    case let .fetchError(error):
        state = .error(error)
    }
}
