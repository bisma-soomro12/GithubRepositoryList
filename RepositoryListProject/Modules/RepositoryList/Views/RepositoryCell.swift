//
//  RepositoryCell.swift
//  RepositoryListProject
//
//  Created by bisma on 25/08/2024.
//

import UIKit

class RepositoryCell: UITableViewCell {

    @IBOutlet weak var repositoryLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var languageStackView: UIStackView!
    @IBOutlet weak var starStackView: UIStackView!
    @IBOutlet weak var starCountLbl: UILabel!
    
    @IBOutlet weak var languageLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    func configureCell(repository: Repositories){
        userNameLbl.text = repository.name
        repositoryLbl.text = repository.full_name
        starCountLbl.text = "\(repository.stargazers_count ?? 0)"
        languageLbl.text = repository.language
        
        if repository.language == nil {
            languageStackView.isHidden = true
        }
        
        if repository.stargazers_count == nil || repository.stargazers_count == 0{
            starStackView.isHidden = true
        }
    }
}
