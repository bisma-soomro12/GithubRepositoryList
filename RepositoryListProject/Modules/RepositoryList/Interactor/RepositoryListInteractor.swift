//
//  RepositoryListInteractor.swift
//  RepositoryListProject
//
//  Created by bisma on 24/08/2024.
//

import Foundation
class RepositoryListInteractor : PresenterToInteractorRepositoryListProtocol{
    var presenter: InteractorToPresenterRepositoryListProtocol?
    
    var repositories: [Repositories] = []
    let url = "https://api.github.com/search/repositories?q=stars"
    
    func onFetchRepositoryList() {
        NetworkRemoteRepository.instance.fetchGitHubRepositories(stringURL: url) {[weak self] results in
            switch results{
            case .success(let response) :
                self?.repositories = response.items ?? [Repositories]()
                self?.presenter?.fetchRepositoryListSuccess(repositories: self?.repositories ?? [Repositories]())
            case .failure(let error):
                print(error.localizedDescription)
                self?.presenter?.fetchRepositoryListFailure(error: error.localizedDescription)
            }
        }
    }
    
    
}
