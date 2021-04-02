//
//  Router.swift
//  CodeChallengeModel
//
//  Created by Rohan Ramsay on 25/12/20.
//

import Combine
import Foundation

protocol Router {
    func dataTaskPublisher(for request: URLRequest) -> AnyPublisher<(data: Data, response: URLResponse), URLError>
}

extension Router {
    func dataTaskPublisher(for request: URLRequest) -> AnyPublisher<(data: Data, response: URLResponse), URLError> {
        URLSession.shared.dataTaskPublisher(for: request)
            .eraseToAnyPublisher()
    }
}

class URLSessionRouter: Router {}
