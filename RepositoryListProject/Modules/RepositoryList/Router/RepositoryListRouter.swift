//
//  RepositoryListRouter.swift
//  RepositoryListProject
//
//  Created by bisma on 24/08/2024.
//

import Foundation
import UIKit
class RepositoryListRouter{
    static func createModule() -> UINavigationController?{
         let stortyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = stortyboard.instantiateViewController(withIdentifier: "RepositoryListVC") as? RepositoryListVC{
            let navigationController = UINavigationController(rootViewController: vc)
            let presenter : ViewToPresenterRepositoryListProtocol & InteractorToPresenterRepositoryListProtocol = RepositoryListPresesnter()
            vc.presenter = presenter
            vc.presenter?.view = vc
            vc.presenter?.interactor = RepositoryListInteractor()
            vc.presenter?.interactor?.presenter = presenter
            return navigationController
            
        }
        
        return UINavigationController()
    }
}
