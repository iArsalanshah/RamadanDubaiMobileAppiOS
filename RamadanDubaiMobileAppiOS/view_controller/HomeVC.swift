//
//  HomeVC.swift
//  RamadanDubaiMobileApp
//
//  Created by Syed Arsalan Shah on 15/07/2019.
//  Copyright © 2019 arsalan. All rights reserved.
//

import UIKit

struct ForumData {
    var title = String()
    var desc = String()
    var image = UIImage()
}

class HomeVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var dataSource: [ForumData] = []
    var currentPosition = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func showCalendar(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "CalendarVC") as? CalendarVC {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func actionShowDetails(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeDetailsVC") as? HomeDetailsVC {
            vc.detailsData = dataSource[currentPosition]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func actionButton(_ sender: UIButton) {
        if sender.tag == 1 {//back
            let position = (currentPosition > 0) ? (currentPosition - 1) : currentPosition
            currentPosition = position
            let data = dataSource[position]
            imageView.image = data.image
            titleLabel.text = data.title
        } else {//forward
            let position = (currentPosition < dataSource.count - 1) ? (currentPosition + 1) : currentPosition
            currentPosition = position
            let data = dataSource[position]
            imageView.image = data.image
            titleLabel.text = data.title
        }
    }
    
}

extension HomeVC {
    private func initData() {
        dataSource = [
            ForumData(title: "Rashid bin Mohammad Ramadan Forum", desc: "Ramadan Forum consists of activities, a series of seminars and educational lectures on tolerance and peaceful coexistence to enhance the role of the members of society and the interaction between people through the perspective of the Qur’an and Sunnah, and strengthen the role of the forum through programs outside the mosques and with the involvement of non-Muslims in the activities of the forum.", image: UIImage(named: "image1")!),
            ForumData(title: "Mohammed attends Dubai Energy Forum", desc: "His Highness Sheikh Mohammed bin Rashid Al Maktoum, Vice-President and Prime Minister of UAE and Ruler of Dubai, today attended the opening of the second edition of the 3-day Dubai Global Energy Forum (DGEF) which is organised here under His Highness' patronage by Dubai Supreme Council of Energy under patronage under the theme \"Clean Energy for Sustainable Development\".", image: UIImage(named: "image2")!)
        ]
    }
}

