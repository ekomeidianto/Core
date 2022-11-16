//
//  File.swift
//  
//
//  Created by Eko Meidianto on 25/10/22.
//

import Foundation

public protocol Mapper {
  associatedtype Response
  associatedtype Entity
  associatedtype Domain

  func transformTeamDomainToEntities(response: Domain) -> Entity
  func transformEntityToDomain(entity: Entity) -> Domain
  func transformResponseToDomain(entity: Response) -> Domain
}
