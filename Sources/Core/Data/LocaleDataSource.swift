//
//  File.swift
//  
//
//  Created by Eko Meidianto on 25/10/22.
//

import Foundation
import Combine

public protocol LocaleDataSource {
  associatedtype Request
  associatedtype Response

  func get() -> AnyPublisher<[Response], Error>
  func add(entity: Request) -> AnyPublisher<Bool, Error>
  func delete(entity: Request) -> AnyPublisher<Bool, Error>
}
