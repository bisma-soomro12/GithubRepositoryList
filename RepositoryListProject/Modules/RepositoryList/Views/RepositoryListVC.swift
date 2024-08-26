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
    
    @IBOutlet weak var retryImgView: UIImageView!
    @IBOutlet weak var retryView: UIView!
    
    @IBOutlet weak var retryBtn: UIButton!
    
    var presenter : (ViewToPresenterRepositoryListProtocol & InteractorToPresenterRepositoryListProtocol)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Trending"
        setupTableView()
        setpBtn()
        presenter?.setupCell(tableView: tableView)
        self.retryView.isHidden = true
        presenter?.viewDidLoad()
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.isSkeletonable = true
        tableView.showAnimatedGradientSkeleton()
        
    }
    
    func setupTableView(){
        tableView.rowHeight = 90
        tableView.estimatedRowHeight = 90
        tableView.dataSource = self
    }
    
    func setpBtn(){
        retryBtn.layer.cornerRadius = 10
        retryBtn.layer.borderWidth = 1
        retryBtn.layer.borderColor = UIColor.systemGreen.cgColor
        retryBtn.tintColor = .systemGreen
        
        if let gifData = NSDataAsset(name: "Animation - 1724400860988")?.data {
            retryImgView.image = UIImage.gif(data: gifData)
                }
    }
    
    @IBAction func retryBtnDidTap(_ sender: Any) {
        self.retryView.isHidden = true
        tableView.isSkeletonable = true
        self.view.showSkeleton()
        tableView.showAnimatedGradientSkeleton()
        presenter?.interactor?.onFetchRepositoryList()
    }
}

extension RepositoryListVC : PresenterToViewRepositoryListProtocol{
    func onFetchRepositoryListSuccess() {
        DispatchQueue.main.async {
            self.retryView.isHidden = true
            self.tableView.reloadData()
            self.tableView.stopSkeletonAnimation()
            self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
        }
        
    }
    
    func onFetchRepositoryListFailure(error: String) {
        self.retryView.isHidden = false
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
