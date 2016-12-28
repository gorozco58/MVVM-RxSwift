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

protocol RepositoryViewModelType {
    
    func fetchRepositories(for observableText: Observable<String>) -> Driver<Result<[Repository]>>
}

struct RepositoryViewModel : RepositoryViewModelType {
    
    func fetchRepositories(for observableText: Observable<String>) -> Driver<Result<[Repository]>> {
        return RepositoryNetworking
            .fetchRepositories(for: observableText)
    }
}
