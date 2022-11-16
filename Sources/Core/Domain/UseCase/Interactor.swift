//
//  File.swift
//  
//
//  Created by Eko Meidianto on 25/10/22.
//

import Foundation
import Combine

public struct Interactor<Request, Response, R: Repository>: UseCase
where R.Request == Request, R.Response == Response {

  private let _repository: R

  public init(repository: R) {
    _repository = repository
  }

  public func getTeamsRemote() -> AnyPublisher<Response, Error> {
    _repository.getRemote()
  }

  public func getTeamsLocale() -> AnyPublisher<Response, Error> {
    _repository.getLocale()
  }

  public func addFavorite(request: Request) -> AnyPublisher<Response, Error> {
    _repository.addItem(request: request)
  }

  public func deleteFavorite(request: Request) -> AnyPublisher<Response, Error> {
    _repository.deleteItem(request: request)
  }
}
