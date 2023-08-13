//
//  PokemonView.swift
//  ReduxPokedex
//
//  Created by Gabriel Zawalski on 26/02/23.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var store: AppStore

    var body: some View {
        switch store.state.pokemon {
        case .fetching:
            ProgressView {
                Text("Loading...")
            }
            .onAppear {
                store.dispatch(action: .pokemon(action: .fetch))
            }

        case .error:
            EmptyView()

        case let .loaded(pokemons):
            List(pokemons, id: \.self) { pokemon in
                Text("\(pokemon.name)")
            }
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemonModel = PokemonModel(name: "Bulba", url: "")
        let store = AppStore(
            state: AppState(pokemon: .loaded([pokemonModel])),
            reducer: appReducer,
            middlewares: []
        )

        PokemonView()
            .environmentObject(store)
    }
}
