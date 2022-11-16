//
//  File.swift
//  
//
//  Created by Eko Meidianto on 25/10/22.
//

import Foundation
import Combine

public protocol RemoteDataSource {
  associatedtype Request
  associatedtype Response

  func get() -> AnyPublisher<Response, Error>
}
