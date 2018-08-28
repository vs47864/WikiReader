//
//  MainViewController.swift
//  WikiReader
//
//  Created by Višeslav Šako on 13/08/2018.
//  Copyright © 2018 viseslav. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    var horizonatlPickerVC: HorizontalPickerVC!
    var textViewVC: TextViewVC!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Wiki Random"
        self.setHorizonatalPicker()
        self.setContentVC()
        self.view.bringSubview(toFront: activityIndicator)
    }
    
    func setHorizonatalPicker()
    {
        horizonatlPickerVC = HorizontalPickerVC()
        let horizontalPickerVM = HorizontalPickerVM()
        horizontalPickerVM.onStartText = {
            self.activityIndicator.startAnimating()
        }
        horizontalPickerVM.onCompleteText = { (text) in
            self.textViewVC.textView.text = text
            self.activityIndicator.stopAnimating()
        }
        horizonatlPickerVC.horizonalPickerVM = horizontalPickerVM
        addChildViewController(horizonatlPickerVC)
        self.view.addSubview(horizonatlPickerVC.view)
        horizonatlPickerVC.didMove(toParentViewController: self)
        
        horizonatlPickerVC.view.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.topMargin)
            make.leading.trailing.equalTo(self.view)
            make.height.equalTo(112)
        }
    }
    
    func setContentVC()
    {
        textViewVC = TextViewVC()
        addChildViewController(textViewVC)
        self.view.addSubview(textViewVC.view)
        
        textViewVC.view.snp.makeConstraints { (make) in
            make.top.equalTo(self.horizonatlPickerVC.view.snp.bottom)
            make.bottom.leading.trailing.equalTo(self.view).inset(16)
        }
    }
}
