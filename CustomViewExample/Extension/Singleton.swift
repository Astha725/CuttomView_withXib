//
//  Singleton.swift
//  DashSpotlessUser
//
//  Created by admin on 20/02/20.
//  Copyright © 2020 admin. All rights reserved.
//com.DashSpotlessUser

import UIKit
import Foundation
import SystemConfiguration



class Singleton: NSObject {
    static let sharedInstance = Singleton()
    
    
    var HBRectView: HBView!
    var bottomAlertHeight:CGFloat?
    
    
    override init() {
        super.init()
        HBRectView = HBView()
       
    }
    
}

func singleton() -> Singleton {
    return Singleton.sharedInstance
}

