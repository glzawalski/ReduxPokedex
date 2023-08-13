//
//  ContentView.swift
//  ReduxPokedex
//
//  Created by Gabriel Zawalski on 26/02/23.
//

import SwiftUI

struct ContentView: View {
    let store = AppStore(
        state: AppState(pokemon: .fetching),
        reducer: appReducer,
        middlewares: [
            pokemonMiddleware(service: PokemonService())
        ]
    )

    let navigation = NavigationManager()

    var body: some View {
        TabView {
            PokemonListView()
                .tabItem {
                    Image(systemName: "house")
                }
        }
        .environmentObject(store)
        .environmentObject(navigation)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
