//
//  File.swift
//  
//
//  Created by Eko Meidianto on 25/10/22.
//

import Foundation
import Combine

public protocol Repository {
  associatedtype Request
  associatedtype Response

  func getRemote() -> AnyPublisher<Response, Error>
  func getLocale() -> AnyPublisher<Response, Error>
  func addItem(request: Request) -> AnyPublisher<Response, Error>
  func deleteItem(request: Request) -> AnyPublisher<Response, Error>
}
