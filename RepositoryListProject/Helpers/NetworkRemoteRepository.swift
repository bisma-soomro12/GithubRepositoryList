//
//  NetworkRemoteRepository.swift
//  RepositoryListProject
//
//  Created by bisma on 25/08/2024.
//

import Foundation
class NetworkRemoteRepository{
    static let instance = NetworkRemoteRepository()
    private init(){
        
    }
    
    func fetchGitHubRepositories(stringURL: String, completion: @escaping ((Result<RepositoryList, ApiError>) -> Void)){
        NetworkManager.instance.apiRequest(apiUrl: stringURL, completion: completion)
    }
}
