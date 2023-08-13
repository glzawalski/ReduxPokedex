//
//  PokemonView.swift
//  ReduxPokedex
//
//  Created by Gabriel Zawalski on 26/02/23.
//

import SwiftUI

struct PokemonListView: View {
    @EnvironmentObject var store: AppStore
    @EnvironmentObject var navigation: NavigationManager

    var body: some View {
        NavigationStack(path: $navigation.path) {
            Group {
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
                        NavigationLink(pokemon.name, value: Route.pokemonDetail(pokemon))
                    }
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .pokemonDetail(let pokemon):
                            PokemonDetailsView(model: pokemon)
                        }
                    }
                }
            }
            .navigationTitle("Pokemon List")
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

        PokemonListView()
            .environmentObject(store)
    }
}
