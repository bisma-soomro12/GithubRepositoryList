//
//  NetworkManager.swift
//  RepositoryListProject
//
//  Created by bisma on 25/08/2024.
//

enum ApiError : Error {
    case internalError
    case serverError
    case parsingError
}


import Foundation
class NetworkManager{
    static let instance = NetworkManager()
    
    private init(){
        
    }
    
    func apiRequest<T: Codable>(apiUrl: String, completion: @escaping ((Result<T, ApiError>) -> Void)){
        guard let url = URL(string: apiUrl) else {
            completion(.failure(.internalError))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, err in
            guard let data = data, err == nil else {
                completion(.failure(.serverError))
                return
            }
            
            do{
                let object = try JSONDecoder().decode(T.self, from: data)
                completion(.success(object))
            }catch{
                completion(.failure(.parsingError))
            }
            
        }
        task.resume()
    }
}
