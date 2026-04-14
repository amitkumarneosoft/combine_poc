//
//  SplashViewModel.swift
//  CombinePOC
//
//  Created by neosoft on 14/04/26.
//

import Foundation
import Combine

@Observable
class SplashViewModel {
    
    var isActive = false
    private var cancellables = Set<AnyCancellable>()
    
    func start() {
        Just(true)
            .delay(for: .seconds(2), scheduler: RunLoop.main)
            .sink { [weak self] value in
                self?.isActive = value
            }
            .store(in: &cancellables)
    }
}
