//
//  AppReducer.swift
//  ReduxPokedex
//
//  Created by Gabriel Zawalski on 26/02/23.
//

import Foundation

typealias Reducer<State, Action> = (inout State, Action) -> Void
func appReducer(state: inout AppState, action: AppAction) {
    switch action {
    case .pokemon(action: let action):
        pokemonReducer(state: &state.pokemon, action: action)
    }
}
