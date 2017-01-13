//
//  MainCoordinator.swift
//  RxAlamofireExample
//
//  Created by Giovanny Orozco on 1/13/17.
//  Copyright © 2017 Giovanny Orozco. All rights reserved.
//

import UIKit

protocol Transitionable: class {
    weak var navigationCoordinator: CoordinatorType? { get }
}

protocol CoordinatorType: class {
    
    var baseController: UIViewController { get }
    
    func performTransition(transition: Transition)
}

enum Transition {
    
    case showRepository(Repository)
}

class MainCoordinator: CoordinatorType {
    var baseController: UIViewController
    
    init() {
        let viewModel = RepositoryViewModel()
        self.baseController = UINavigationController(rootViewController: MainViewController(viewModel: viewModel))
        viewModel.navigationCoordinator = self
    }
    
    func performTransition(transition: Transition) {
        switch transition {
        case .showRepository(let repository):
            UIApplication.shared.open(URL(string: repository.url)!, options: [:], completionHandler: nil)
        }
    }
}
