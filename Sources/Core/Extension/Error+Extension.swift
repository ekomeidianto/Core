//
//  File.swift
//  
//
//  Created by Eko Meidianto on 14/11/22.
//

import Foundation

public enum URLError: LocalizedError {
  case invalidResponse
  case urlUnreachable(URL)

  public var errorDescription: String? {
    switch self {
      case .invalidResponse: return "The server responded with garbage."
      case .urlUnreachable(let url): return "\(url.absoluteString) is unreachable."
    }
  }
}

public enum DatabaseError: LocalizedError {
  case invalidDatabase
  case requestFailed

  public var errorDescription: String? {
    switch self {
    case .invalidDatabase: return "Database can't access."
    case .requestFailed: return "Your request failed."
    }
  }
}
