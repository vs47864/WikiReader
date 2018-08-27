//
//  HorizontalPickerCell.swift
//  WikiReader
//
//  Created by Višeslav Šako on 27/08/2018.
//  Copyright © 2018 viseslav. All rights reserved.
//

import UIKit

class HorizontalPickerCell: UICollectionViewCell {

    lazy var lblTitle: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.backgroundColor = .orange
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(lblTitle)
        contentView.clipsToBounds = true
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        //TODO to snapkit
        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: contentView.topAnchor),
            lblTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            lblTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            lblTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor)
            ])
    }

}
