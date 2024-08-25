//
//  RepositoryListProtocols.swift
//  RepositoryListProject
//
//  Created by bisma on 24/08/2024.
//

import Foundation
import UIKit
protocol ViewToPresenterRepositoryListProtocol{
    var view : PresenterToViewRepositoryListProtocol? { get set }
    var interactor : PresenterToInteractorRepositoryListProtocol? { get set }
    // router
    func viewDidLoad()
    func refresh()
    func numberOfRowsInSection() -> Int
    func setCell(tableView: UITableView, forRowAt: IndexPath) -> UITableViewCell
    func setupCell(tableView: UITableView)
}

protocol PresenterToViewRepositoryListProtocol{
    func onFetchRepositoryListSuccess()
    func onFetchRepositoryListFailure(error: String)
    func showActivity()
    func hideActivit()
}


protocol PresenterToInteractorRepositoryListProtocol{
    var presenter : InteractorToPresenterRepositoryListProtocol? { get set}
    var repositories : [Repositories] { get set }
    func onFetchRepositoryList()
}

protocol InteractorToPresenterRepositoryListProtocol{
    func fetchRepositoryListSuccess(repositories: [Repositories])
    func fetchRepositoryListFailure(error: String)
}
