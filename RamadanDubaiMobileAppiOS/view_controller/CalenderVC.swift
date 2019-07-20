
//
//  CalenderVC.swift
//  RamadanDubaiMobileAppiOS
//
//  Created by Syed Arsalan Shah on 7/20/19.
//  Copyright © 2019 Syed Arsalan Shah. All rights reserved.
//

import UIKit

class CalendarVC: BaseController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelSegmentType: UILabel!
    
    private var dataSource = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSegmentUpdate(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1://location
            labelSegmentType.isHidden = false
            labelSegmentType.text = "Location"
            tableView.isHidden = true
            break
        case 2://feature
            labelSegmentType.isHidden = false
            labelSegmentType.text = "Feature"
            tableView.isHidden = true
            break
        case 3://name
            labelSegmentType.isHidden = false
            labelSegmentType.text = "Name"
            tableView.isHidden = true
            break
        case 4://country
            labelSegmentType.isHidden = false
            labelSegmentType.text = "Country"
            tableView.isHidden = true
            break
        default://day
            labelSegmentType.isHidden = true
            tableView.isHidden = false
            break
        }
    }
    
    private func setupData() {
        for i in 1...20 {
            dataSource.append("Sunday, \(i) Ramadan 1440")
        }
    }
}

extension CalendarVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if(!(cell != nil))
        {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        }
        cell!.textLabel?.textColor = Constants.APP_DELEGATE.themeColor
        cell!.textLabel?.text = dataSource[indexPath.row]
        return cell!
    }
}
