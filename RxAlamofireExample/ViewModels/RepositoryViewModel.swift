//
//  RepositoryViewModel.swift
//  RxAlamofireExample
//
//  Created by Giovanny Orozco on 12/28/16.
//  Copyright © 2016 Giovanny Orozco. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import Alamofire

protocol RepositoryViewModelType: Transitionable {
    
    var repositorySubject: PublishSubject<Repository> { get }
    
    func fetchRepositories(for observableText: Observable<String>) -> Driver<Result<[Repository]>>
}

class RepositoryViewModel : RepositoryViewModelType {
    
    fileprivate let disposeBag = DisposeBag()
    var repositorySubject = PublishSubject<Repository>()
    weak var navigationCoordinator: CoordinatorType?
    
    init() {
        
        repositorySubject
            .asObservable()
            .subscribe(onNext: { [unowned self] in
                self.navigationCoordinator?.performTransition(transition: .showRepository($0))
            })
            .addDisposableTo(disposeBag)
    }
    
    func fetchRepositories(for observableText: Observable<String>) -> Driver<Result<[Repository]>> {
        return RepositoryNetworking
            .fetchRepositories(for: observableText)
    }
}
