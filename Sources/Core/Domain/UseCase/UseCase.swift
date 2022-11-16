//
//  File.swift
//  
//
//  Created by Eko Meidianto on 25/10/22.
//

import Foundation
import Combine

public protocol UseCase {
  associatedtype Request
  associatedtype Response

  func getTeamsRemote() -> AnyPublisher<Response, Error>
  func getTeamsLocale() -> AnyPublisher<Response, Error>
  func addFavorite(request: Request) -> AnyPublisher<Response, Error>
  func deleteFavorite(request: Request) -> AnyPublisher<Response, Error>
}
