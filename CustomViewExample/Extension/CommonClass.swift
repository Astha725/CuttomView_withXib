//
//  CommonClass.swift
//  CustomViewExample
//
//  Created by Rohit Bisht on 12/09/21.
//

import Foundation
import UIKit

extension UIColor{
    
    fileprivate static func rgba(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
    fileprivate static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return rgba(r, g, b, 1.0)
    }
    
    static let App_BlueColor = rgb(21, 151, 203)
    static let App_Dark_BlueColor = rgb(0, 112, 147)
    static let App_TransparentBlackColor = rgba(0, 0, 0, 0.5)
    static let App_ExtraLightGrayColor = rgb(218,222,229)
    static let App_LightGrayColor = rgb(218,222,239)
 
}

fileprivate extension UINib {
    
    static func nib(named nibName: String) -> UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
    
    static func loadSingleView(_ nibName: String, owner: Any?) -> UIView {
        return nib(named: nibName).instantiate(withOwner: owner, options: nil)[0] as! UIView
    }
}

extension UINib {
    
    class func loadCustomView(_ owner: AnyObject) -> UIView {
        return loadSingleView("ExampleCutomView", owner: owner)
    }
    
}
