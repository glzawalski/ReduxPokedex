//
//  NavigationManager.swift
//  ReduxPokedex
//
//  Created by Gabriel Zawalski on 13/08/23.
//

import Foundation

enum Route: Hashable {
    case pokemonDetail(PokemonModel)
}

class NavigationManager: ObservableObject {
    @Published var path = [Route]()
}
