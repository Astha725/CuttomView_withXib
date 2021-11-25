//
//  ViewController.swift
//  CustomViewExample
//
//  Created by Rohit Bisht on 12/09/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        openWalletView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        
        openWalletView()
    }

    func openWalletView() {
        let sacrificeView = UINib.loadCustomView(ExampleCutomView.self) as! ExampleCutomView
        sacrificeView.delegate = self
        singleton().HBRectView.addSubViewToParentWindow(view: sacrificeView, withFrame: CGRect(x: 20, y:0,  width: UIScreen.main.bounds.width - 40 , height: sacrificeView.frame.height), isCenter: true, animationDirection: .right, animationOffest: 50.0, isAnimation: false)
    }
    
}

extension ViewController: CustomViewDelegate {
    
    func backFromCustomView() {
        print("")
    }
    
   
    
    
}
