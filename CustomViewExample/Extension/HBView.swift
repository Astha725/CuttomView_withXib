//
//  SignInViewController.swift
//  PowerPointz
//
//  Created by admin on 24/09/19.
//  Copyright © 2019 admin. All rights reserved.
//
import Foundation
import UIKit
import ViewAnimator

class HBView: UIView {
     var transParentView =  UIView()
     var customView = UIView()

    
    func addSubViewToParentWindow(view:UIView,withFrame:CGRect,isCenter:Bool,animationDirection:Direction,animationOffest:CGFloat, isAnimation:Bool){
        self.transParentView.removeFromSuperview()
        if #available(iOS 13.0, *) {
            let appDelegate = UIApplication.shared.connectedScenes
                .first!.delegate as! SceneDelegate
            let ParentView = appDelegate.window?.frame
            view.frame = withFrame
            //view.backgroundColor = .green
            self.transParentView = UIView(frame:ParentView!)
            if isCenter{view.center =  self.transParentView.center}
            self.customView = view
            self.transParentView.backgroundColor = UIColor.App_TransparentBlackColor
            let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(removeSubviewFromParentWidnow))
            tapGesture.delegate = self
            self.transParentView.addGestureRecognizer(tapGesture)
            self.transParentView.addSubview(self.customView)
            appDelegate.window?.addSubview(self.transParentView)
         //   sceneDelegate.window!.rootViewController = /* ViewController Instance */
        // iOS12 or earlier
        } else {
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            let ParentView = appDelegate?.window?.frame
            view.frame = withFrame
            //view.backgroundColor = .green
            self.transParentView = UIView(frame:ParentView!)
            if isCenter{view.center =  self.transParentView.center}
            self.customView = view
            self.transParentView.backgroundColor = UIColor.App_TransparentBlackColor
            let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(removeSubviewFromParentWidnow))
            tapGesture.delegate = self
            self.transParentView.addGestureRecognizer(tapGesture)
            self.transParentView.addSubview(self.customView)
            appDelegate?.window?.addSubview(self.transParentView)
           // appDelegate.window!.rootViewController = /* ViewController Instance */
        }
        
        
      //  isAnimation ? self.animateView(view: view, type: animationDirection, offset: animationOffest) : nil
    }

   @objc func removeSubviewFromParentWidnow(){
        self.transParentView.removeFromSuperview()
    }

//    func animateView(view:UIView,type:Direction,offset:CGFloat) {
//        let animation = AnimationType.from(direction: type, offset: offset) //UIScreen.main.bounds.width
//        view.animate(animations: [animation], reversed: false, initialAlpha: 0.5, finalAlpha: 1.0, delay: 0.0, duration: 0.5, options: .curveEaseInOut, completion: nil)
 //   }
    
//    func showAlert(message:String){
//        singleton().bottomAlertHeight = message.count > 50 ? 60 : 40
//        let alert = JDropDownAlert(position: .bottom)
//        alert.messageFont = UIFont.SystemBoldSize16
//        alert.height = singleton().bottomAlertHeight!
//        alert.alertWith("",message: message,topLabelColor: UIColor.clear,messageLabelColor:.white,backgroundColor:UIColor(red: 0/255, green: 167/255, blue: 184/255, alpha: 1.0))
//    }
//    
  
    
}

extension HBView:UIGestureRecognizerDelegate{
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of:self.customView))!{
            return false
        }
        return true
    }
}

/// Direction of the animation used in AnimationType.from.
public enum Direction: Int, CaseIterable {

    case top
    case left
    case right
    case bottom
    
    /// Checks if the animation should go on the X or Y axis.
    var isVertical: Bool {
        switch self {
        case .top, .bottom:
            return true
        default:
            return false
        }
    }

    /// Positive or negative value to determine the direction.
    var sign: CGFloat {
        switch self {
        case .top, .left:
            return -1
        case .right, .bottom:
            return 1
        }
    }

    /// Random direction.
    static func random() -> Direction {
        return allCases.randomElement()!
    }
}
