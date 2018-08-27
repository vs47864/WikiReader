//
//  HorizontalPickerVC.swift
//  WikiReader
//
//  Created by Višeslav Šako on 16/08/2018.
//  Copyright © 2018 viseslav. All rights reserved.
//

import UIKit

class HorizontalPickerVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private var cellIdentifier = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(HorizontalPickerCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.dataSource = self
        collectionView.collectionViewLayout = HorizontalPickerCollectionViewFlowLayout()

    }
}

extension HorizontalPickerVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! HorizontalPickerCell
        
        cell.lblTitle.text = "\(indexPath.row)"
        return cell
    }
}
