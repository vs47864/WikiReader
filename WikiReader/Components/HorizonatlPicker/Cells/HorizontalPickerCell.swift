//
//  HorizontalPickerCell.swift
//  WikiReader
//
//  Created by Višeslav Šako on 27/08/2018.
//  Copyright © 2018 viseslav. All rights reserved.
//

import UIKit

let cellIdentifier = "HorizontalPickerCell"

class HorizontalPickerCell: UICollectionViewCell {

    lazy var lblTitle: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.numberOfLines = 0
        view.textColor = .white
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .cellColor
        contentView.addSubview(lblTitle)
        contentView.clipsToBounds = true
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self.contentView)
            make.leading.trailing.equalTo(self.contentView).inset(8)
        }

    }

}
