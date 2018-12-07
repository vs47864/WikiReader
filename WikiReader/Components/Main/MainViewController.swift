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
    
    var horizontalPickerVC: HorizontalPickerVC!
    var textViewVC: TextViewVC!
    var mainVM: MainVMProtocol!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = mainVM.getTitle()
        self.setHorizonatalPicker()
        self.setContentVC()
        self.view.bringSubview(toFront: activityIndicator)
    }
    
    func setHorizonatalPicker()
    {
        horizontalPickerVC = HorizontalPickerVC()
        let horizontalPickerVM = HorizontalPickerVM()
        horizontalPickerVM.onStartText = {
            self.activityIndicator.startAnimating()
        }
        horizontalPickerVM.onCompleteText = { (text) in
            self.textViewVC.textView.text = text
            self.activityIndicator.stopAnimating()
        }
        horizontalPickerVC.horizontalPickerVM = horizontalPickerVM
        addChildViewController(horizontalPickerVC)
        self.view.addSubview(horizontalPickerVC.view)
        horizontalPickerVC.didMove(toParentViewController: self)
        
        horizontalPickerVC.view.snp.makeConstraints { (make) in
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
            make.top.equalTo(self.horizontalPickerVC.view.snp.bottom)
            make.bottom.leading.trailing.equalTo(self.view).inset(16)
        }
    }
}

protocol MainVMProtocol
{
    func getTitle() -> String
}
