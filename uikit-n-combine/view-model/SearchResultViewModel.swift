//
//  SearchResultViewModel.swift
//  uikit-n-combine
//
//  Created by Bruno Rocha on 18/06/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation
import Combine

class SearchResultViewModel: Publisher {
    typealias Output = Void
    typealias Failure = Never
    
    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
        Service.shared.fetchApps(searchTerm: searchTerm) { (results, error) in
            if let error = error {
                Swift.print(error)
            }
            
            DispatchQueue.main.async {
                _ = subscriber.receive(())
                subscriber.receive(completion: .finished)
                self.results = results
            }
        }
    }

    var results: [Result] = []
    
    var searchTerm = "Facebook"
}
