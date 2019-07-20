//
//  Utility.swift
//  RamadanDubaiMobileApp
//
//  Created by Syed Arsalan Shah on 15/07/2019.
//  Copyright © 2019 arsalan. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class Utility: NVActivityIndicatorViewable {
    
    func topViewController(base: UIViewController? = (Constants.APP_DELEGATE).window?.rootViewController) -> UIViewController? {
    
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        
        return base
    }
    
    static func showWillBeImplenentAlert() {
        showAlert(title: "Message", message: "This functionality will be implmented in next build")
    }

    static func showAlert(title:String?, message:String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in })
        Utility().topViewController()!.present(alert, animated: true){}
    }
    
    static func showAlert(title:String?, message:String?, buttonText: String = "OK", closure: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonText, style: .default) { onClick in
            closure(onClick)
        })
        Utility().topViewController()!.present(alert, animated: true){}
    }
    
    static func showAlertWithYesNo(title:String?, message:String?, closure: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "No", style: .default) { onClick in
            alert.dismiss(animated: true, completion: {
                //ignore
            })
        })
        alert.addAction(UIAlertAction(title: "Yes", style: .default) { onClick in
            closure(onClick)
        })
        Utility().topViewController()!.present(alert, animated: true){}
    }
    
    static func resizeImage(image: UIImage,  targetSize: CGFloat) -> UIImage {
        
        guard (image.size.width > 1024 || image.size.height > 1024) else {
            return image;
        }
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newRect: CGRect = CGRect.zero;
        
        if(image.size.width > image.size.height) {
            newRect.size = CGSize(width: targetSize, height: targetSize * (image.size.height / image.size.width))
        } else {
            newRect.size = CGSize(width: targetSize * (image.size.width / image.size.height), height: targetSize)
        }
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newRect.size, false, 1.0)
        image.draw(in: newRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    static func delay(delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }

    static func showLoader() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let size = CGSize(width: 50, height: 50)
        let bgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        let activityData = ActivityData(size: size, message: "", messageFont: UIFont.systemFont(ofSize: 12), type: .ballSpinFadeLoader, color: Constants.APP_DELEGATE.themeColor, padding: 0, displayTimeThreshold: 0, minimumDisplayTime: 1, backgroundColor: bgColor, textColor: UIColor.black)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
    }
    
    static func hideLoader() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
    }
    
    static func getIndexPathForRow(_ tableView: UITableView, sender: AnyObject) -> IndexPath? {
        let position = sender.convert(CGPoint.zero, to: tableView)
        return tableView.indexPathForRow(at: position)
    }

    static func jsonEncode(object: AnyObject?) -> Data? {
        if JSONSerialization.isValidJSONObject(object as? Any ?? "") {
            return try? JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
        }
        return nil
    }
}











