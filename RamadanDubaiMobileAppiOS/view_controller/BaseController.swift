//
//  BaseController.swift
//  RamadanDubaiMobileApp
//
//  Created by Syed Arsalan Shah on 15/07/2019.
//  Copyright © 2019 arsalan. All rights reserved.
//

import UIKit

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let navControllers = self.navigationController?.viewControllers {
            for vc in navControllers {
                if vc.isKind(of: LoginVC.self) {
                    addLeftNavItem(isMenu: false)
                }
            }
        }
    }
    
    func addLeftNavItem(isMenu: Bool) {
        let image = #imageLiteral(resourceName: "ic_backward")
        let backItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(popViewController))
        self.navigationItem.leftBarButtonItem = backItem
    }
    
    @objc func popViewController() {
        if (self.navigationController?.viewControllers.count)! > 1 {
            self.navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func openSideMenu() {
        
    }
    
    func showController(id: String) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: id) {
            self.navigationController?.pushViewController(vc, animated: true)            
        }
    }
}
