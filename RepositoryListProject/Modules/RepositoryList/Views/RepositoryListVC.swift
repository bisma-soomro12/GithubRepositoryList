//
//  ViewController.swift
//  RepositoryListProject
//
//  Created by bisma on 24/08/2024.
//

import UIKit

class RepositoryListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var presenter : (ViewToPresenterRepositoryListProtocol & InteractorToPresenterRepositoryListProtocol)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        presenter?.setupCell(tableView: tableView)
        tableView.dataSource = self
    }


}

extension RepositoryListVC : PresenterToViewRepositoryListProtocol{
    func onFetchRepositoryListSuccess() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    func onFetchRepositoryListFailure(error: String) {
        print(error)
    }
    
    func showActivity() {
        
    }
    
    func hideActivit() {
        
    }
}

extension RepositoryListVC : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter?.setCell(tableView: tableView, forRowAt: indexPath) ?? UITableViewCell()
    }
}
