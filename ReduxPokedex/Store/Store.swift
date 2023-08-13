//
//  Store.swift
//  ReduxPokedex
//
//  Created by Gabriel Zawalski on 26/02/23.
//

import Combine
import Foundation

typealias AppStore = Store<AppState, AppAction>
final class Store<State, Action>: ObservableObject {
    @Published private(set) var state: State
    let reducer: Reducer<State, Action>
    let middlewares: [Middleware<State, Action >]
    private var cancellables: Set<AnyCancellable> = []

    init(state: State, reducer: @escaping Reducer<State, Action>, middlewares: [Middleware<State, Action>]) {
        self.state = state
        self.reducer = reducer
        self.middlewares = middlewares
    }

    func dispatch(action: Action) {
        reducer(&state, action)

        for middleware in middlewares {
            guard let middleware = middleware(state, action) else { break }

            middleware
                .subscribe(on: DispatchQueue.main)
                .sink(receiveValue: dispatch)
                .store(in: &cancellables)
        }
    }
}
