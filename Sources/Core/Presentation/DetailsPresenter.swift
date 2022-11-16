//
//  File.swift
//  
//
//  Created by Eko Meidianto on 16/11/22.
//

import SwiftUI
import Combine

public class DetailsPresenter<Request, Response, Interactor: UseCase>:
  ObservableObject where Interactor.Request == Request, Interactor.Response == [Response] {

  private var cancellables: Set<AnyCancellable> = []

  private let _useCase: Interactor

  @Published public var errorMessage: String = ""
  @Published public var isLoading: Bool = false
  @Published public var isFavorite: Bool = false
  @Published public var isError: Bool = false
  @Published public var list: [Response] = []
  @Published public var team: Response

  public init(useCase: Interactor, team: Response) {
    _useCase = useCase
    self.team = team
  }

  public func addToFavorite(request: Request) {
    _useCase.addFavorite(request: request)
      .receive(on: RunLoop.main)
      .sink { response in
        switch response {
          case .failure: self.errorMessage = String(describing: response)
          case .finished: self.isLoading = false
        }
      } receiveValue: { _ in
        self.isFavorite  = true
      }
      .store(in: &cancellables)
  }

  public func deleteFromFavorite(request: Request) {
    _useCase.deleteFavorite(request: request)
      .receive(on: RunLoop.main)
      .sink { response in
        switch response {
          case .failure: self.errorMessage = String(describing: response)
          case .finished: self.isLoading = false
        }
      } receiveValue: { _ in
        self.isFavorite = false
      }
      .store(in: &cancellables)
  }

  public func getListLocale(callback: (() -> Void)? = nil) {
    isLoading = true
    _useCase.getTeamsLocale()
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
          case .failure(let error):
            self.errorMessage = error.localizedDescription
            self.isError = true
            self.isLoading = false
          case .finished:
            self.isLoading = false
        }
      }, receiveValue: { list in
        self.list = list
        if let callback = callback {
          callback()
        }
      })
      .store(in: &cancellables)
  }
}
