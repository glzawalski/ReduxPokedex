//
//  PokemonService.swift
//  ReduxPokedex
//
//  Created by Gabriel Zawalski on 26/02/23.
//

import Combine
import Foundation

final class PokemonService {
    func fetchPokemonList() -> AnyPublisher<PokemonList, Error> {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=10000&offset=0")!
        let request = URLRequest(url: url)
        return URLSession.shared.dataTaskPublisher(for: request)
            .delay(for: 2, scheduler: DispatchQueue.main)
            .map(\.data)
            .decode(type: PokemonList.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
