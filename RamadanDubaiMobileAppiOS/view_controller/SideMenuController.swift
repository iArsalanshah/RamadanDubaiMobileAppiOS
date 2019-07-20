//
//  SideMenuController.swift
//  RamadanDubaiMobileApp
//
//  Created by Syed Arsalan Shah on 15/07/2019.
//  Copyright © 2019 arsalan. All rights reserved.
//

import UIKit
import SideMenu

struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class SideMenuController: BaseController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = [
            cellData(opened: false, title: "Login", sectionData: []),
            cellData(opened: false, title: "Register", sectionData: []),
            cellData(opened: false, title: "Features", sectionData: ["Feature 1", "Feature 2", "Feature 3"]),
            cellData(opened: false, title: "About Ramadan Dubai", sectionData: ["About Us", "Contact Us"]),
            cellData(opened: false, title: "Setting", sectionData: ["Notification", "Profile Update"]),
            cellData(opened: false, title: "العربية‎", sectionData: [])
        ]
        tableView.separatorStyle = .none
    }
}

// MARK: - UITableViewDataSource
extension SideMenuController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataSource[section].opened == true) ? dataSource[section].sectionData.count + 1 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuTVC") as? SideMenuTVC else { return UITableViewCell() }
        cell.selectionStyle = .none
        let section = indexPath.section
        let index = indexPath.row - 1
        let data = dataSource[section]
        
        cell.titleLabel.text = indexPath.row == 0 ? data.title : data.sectionData[index]
        
        cell.addImageView.isHidden = !(indexPath.row == 0 && data.sectionData.count > 0)
        cell.bottomLineView.isHidden = indexPath.row != 0 || section == dataSource.count - 1
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        let index = indexPath.row
        if index == 0 && dataSource[section].sectionData.count > 0 {
            dataSource[indexPath.section].opened = !dataSource[indexPath.section].opened
            let section = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section, with: .none)
        } else if index == 0 {
            switch section {
                case 0://login
                    self.showController(id: "LoginVC")
                    break
                default:
                    break
            }
        }
    }
}
