//
//  File.swift
//  
//
//  Created by Eko Meidianto on 25/10/22.
//

import SwiftUI
import Combine

public class GetListPresenter<Request, Response, Interactor: UseCase>:
  ObservableObject where Interactor.Request == Request, Interactor.Response == [Response] {

  private var cancellables: Set<AnyCancellable> = []

  private let _useCase: Interactor

  @Published public var list: [Response] = []
  @Published public var errorMessage: String = ""
  @Published public var isLoading: Bool = false
  @Published public var isError: Bool = false

  public init(useCase: Interactor) {
    _useCase = useCase
  }

  public func getListRemote(request: Request?) {
    isLoading = true
    _useCase.getTeamsRemote()
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
      })
      .store(in: &cancellables)
  }

  public func getListLocale(request: Request?) {
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
      })
      .store(in: &cancellables)
  }
}
