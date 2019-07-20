//
//  HomeDetailsVC.swift
//  RamadanDubaiMobileApp
//
//  Created by Syed Arsalan Shah on 15/07/2019.
//  Copyright © 2019 arsalan. All rights reserved.
//

import UIKit

class HomeDetailsVC: BaseController {
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var detailsImageView: UIImageView!
    
    internal var detailsData: ForumData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        if let data = detailsData {
            self.mainTitle.text = data.title
            self.descriptionLabel.text = data.desc
            self.detailsImageView.image = data.image
        }
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.popViewController()
    }
    
}
