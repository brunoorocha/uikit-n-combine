//
//  BaseCollectionController.swift
//  uikit-n-combine
//
//  Created by Vinicius Mangueira Correia on 18/06/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class BaseCollectionController: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
