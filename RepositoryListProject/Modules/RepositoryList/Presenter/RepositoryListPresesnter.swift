//
//  RepositoryListPresesnter.swift
//  RepositoryListProject
//
//  Created by bisma on 24/08/2024.
//

import Foundation
import UIKit
class RepositoryListPresesnter : ViewToPresenterRepositoryListProtocol{
    var repositories = [Repositories]()
    var view: PresenterToViewRepositoryListProtocol?
    var interactor: PresenterToInteractorRepositoryListProtocol?
    
    func viewDidLoad() {
        view?.showActivity()
        interactor?.onFetchRepositoryList()
    }
    
    func refresh() {
        
    }
    
    func setupCell(tableView: UITableView){
        tableView.register(UINib(nibName: "RepositoryCell", bundle: nil), forCellReuseIdentifier: "RepositoryCell")
    }
    
    func numberOfRowsInSection() -> Int {
        return repositories.count
    }
    
    func setCell(tableView: UITableView, forRowAt: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell", for: forRowAt) as? RepositoryCell{
            cell.configureCell(repository: self.repositories[forRowAt.row])
        return cell
        }
        return UITableViewCell()
    }
    
    
}

extension RepositoryListPresesnter : InteractorToPresenterRepositoryListProtocol{
    func fetchRepositoryListSuccess(repositories: [Repositories]) {
        self.repositories = repositories
        view?.onFetchRepositoryListSuccess()
        view?.hideActivit()
    }
    
    func fetchRepositoryListFailure(error: String) {
        view?.hideActivit()
        view?.onFetchRepositoryListFailure(error: "Fetching Error \(error)")
    }
    
    
}
