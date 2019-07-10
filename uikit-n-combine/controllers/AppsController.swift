//
//  ViewController.swift
//  uikit-n-combine
//
//  Created by Bruno Rocha on 18/06/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

struct MyPublisher: Publisher {
    typealias Output = String
    typealias Failure = Never
    
    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            _ = subscriber.receive("Deu bom, cabrón")
            subscriber.receive(completion: .finished)
        }
    }
}

class AppsController: BaseCollectionController {

    fileprivate let cellId = "cellId"
    
    var searchViewModel = SearchResultViewModel()    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        navigationItem.title = "Today"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        _ = searchViewModel.sink {
            self.collectionView.reloadData()
        }
    }
}

extension AppsController: UICollectionViewDelegateFlowLayout {
    
    fileprivate func setupCollection() {
        self.collectionView.backgroundColor = .white
        self.collectionView.register(AppsViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsViewCell
        cell.result = searchViewModel.results[indexPath.row]
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchViewModel.results.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.view.frame.width - 68, height: 380)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 10, bottom: 10, right: 10)
    }
}
