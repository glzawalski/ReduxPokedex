//
//  PokemonMiddleware.swift
//  ReduxPokedex
//
//  Created by Gabriel Zawalski on 26/02/23.
//

import Combine
import Foundation

typealias Middleware<State, Action> = (State, Action) -> AnyPublisher<Action, Never>?
func pokemonMiddleware(service: PokemonService) -> Middleware<AppState, AppAction> {
    return { _, action in
        switch action {
        case .pokemon(action: .fetch):
            return service.fetchPokemonList()
                .receive(on: DispatchQueue.main)
                .map { AppAction.pokemon(action: .fetchCompletion(data: $0.results)) }
                .catch { error -> Just<AppAction> in
                    return Just(AppAction.pokemon(action: .fetchError(error: error)))
                }
                .eraseToAnyPublisher()

        default:
            return Empty()
                .eraseToAnyPublisher()
        }
    }
}
