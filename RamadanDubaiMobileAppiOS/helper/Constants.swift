//
//  Constants.swift
//  Template
//
//  Created by Akber Sayani on 02/01/2017.
//  Copyright © 2017 Akber Sayani. All rights reserved.
//
import UIKit
import Foundation

struct Constants {
    
    static let kFONT_WIDTH_FACTOR           = UIScreen.main.bounds.width / 414 //resize font according to screen size
    
    static let kWINDOW_FRAME                = UIScreen.main.bounds
    static let kSCREEN_SIZE                 = UIScreen.main.bounds.size
    static let kWINDOW_WIDTH                = UIScreen.main.bounds.size.width
    static let kWINDOW_HIEGHT               = UIScreen.main.bounds.size.height
    
    static let APP_DELEGATE                = UIApplication.shared.delegate as! AppDelegate
    static let UIWINDOW                    = UIApplication.shared.delegate!.window!
    
    static let FAILURE_MESSAGE                         = "Something went wrong. Please try again"

}
