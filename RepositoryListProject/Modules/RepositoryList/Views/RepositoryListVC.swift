//
//  ViewController.swift
//  RepositoryListProject
//
//  Created by bisma on 24/08/2024.
//

import UIKit
import SkeletonView

class RepositoryListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var presenter : (ViewToPresenterRepositoryListProtocol & InteractorToPresenterRepositoryListProtocol)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 90
        tableView.estimatedRowHeight = 90
        tableView.reloadData()
        tableView.dataSource = self
        presenter?.setupCell(tableView: tableView)
        presenter?.viewDidLoad()
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.isSkeletonable = true
        tableView.showAnimatedGradientSkeleton()
        
    }
}

extension RepositoryListVC : PresenterToViewRepositoryListProtocol{
    func onFetchRepositoryListSuccess() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.tableView.stopSkeletonAnimation()
            self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
        }
        
    }
    
    func onFetchRepositoryListFailure(error: String) {
        print(error)
    }
}

extension RepositoryListVC : SkeletonTableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter?.setCell(tableView: tableView, forRowAt: indexPath) ?? UITableViewCell()
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "RepositoryCell"
    }
}
