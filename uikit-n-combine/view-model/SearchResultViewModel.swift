//
//  SearchResultViewModel.swift
//  uikit-n-combine
//
//  Created by Bruno Rocha on 18/06/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import SwiftUI
import Combine

class SearchResultViewModel: BindableObject {
    var didChange = PassthroughSubject<SearchResultViewModel, Never>()
    
    var results: [Result] = [] {
        didSet {
            didChange.send(self)
        }
    }
    
    var searchTerm = "" {
        didSet {
            load()
        }
    }
    
    func load() {
        Service.shared.fetchApps(searchTerm: searchTerm) { (results, error) in
            if let error = error {
                print(error)
            }
            
            self.results = results
        }
    }
}
