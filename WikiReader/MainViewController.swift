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

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Wiki Random"
        horizonatlPickerVC = HorizontalPickerVC()
        addChildViewController(horizonatlPickerVC)
        self.view.addSubview(horizonatlPickerVC.view)
        horizonatlPickerVC.didMove(toParentViewController: self)
        
        horizonatlPickerVC.view.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.topMargin)
            make.leading.trailing.equalTo(self.view)
            make.height.equalTo(250)
        }
        
    }


}
