//
//  Service.swift
//  uikit-n-combine
//
//  Created by Bruno Rocha on 18/06/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class Service {
    static let shared = Service()
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> () ) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        let urlSession = URLSession.shared
        guard let url = URL(string: urlString) else {return}
        
        urlSession.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            
            if let error = error {
                print("Failed to fetch apps", error)
                completion([], error)
                return
            }
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results, nil)
                
            } catch let jsonError{
                print("Failed to decode JSON:", jsonError)
                completion([], jsonError)
            }
            }.resume()
    }
}
