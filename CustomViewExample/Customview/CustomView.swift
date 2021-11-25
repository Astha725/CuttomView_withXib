//
//  CustomView.swift
//  VideoFilterApp
//
//  Created by Rohit Bisht on 12/09/21.
//

import UIKit
import Foundation

protocol CustomViewDelegate{
    func backFromCustomView()
}


class CustomView: UIView {

    var delegate: CustomViewDelegate?

    
    @IBAction func cancelAction(_ sender: Any) {
        
        singleton().HBRectView.removeSubviewFromParentWidnow()
    }
    
    @IBAction func okAction(_ sender: Any) {
//        singleton().walletAmount = Int(txtfield.text!) ?? 0
//
//        if singleton().walletAmount != 0 {
        delegate?.backFromCustomView()
        singleton().HBRectView.removeSubviewFromParentWidnow()
//        } else {
//
//        }
    }
    
}




