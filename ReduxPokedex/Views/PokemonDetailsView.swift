//
//  PokemonDetails.swift
//  ReduxPokedex
//
//  Created by Gabriel Zawalski on 13/08/23.
//

import SwiftUI

struct PokemonDetailsView: View {
    @EnvironmentObject var navigation: NavigationManager

    let model: PokemonModel

    var body: some View {
        VStack {
            Text(model.name)

            Divider()

            Button {
                navigation.path.append(contentsOf: [.pokemonDetail(.init(name: "Bulba", url: ""))])
            } label: {
                Text("Show Bulba")
            }

            Button {
                navigation.path = []
            } label: {
                Text("Pop to root")
            }


        }
        .navigationTitle(model.name)
    }
}

struct PokemonDetails_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView(model: .init(name: "Bulba", url: ""))
    }
}
