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
    var horizontalPickerVM: HorizontalPickerVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        horizontalPickerVM.delegate = self
        
        collectionView.register(HorizontalPickerCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self;
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = HorizontalPickerCollectionViewFlowLayout()
    }
}

extension HorizontalPickerVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return horizontalPickerVM.getNumberOfArtcels()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! HorizontalPickerCell
        
        cell.lblTitle.text = horizontalPickerVM.getTitleForIndex(index: indexPath.row)
        return cell
    }
}

extension HorizontalPickerVC: UIScrollViewDelegate
{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let center = CGPoint(x: collectionView.contentOffset.x + collectionView.frame.size.width/2, y: collectionView.contentOffset.y + collectionView.frame.size.height/2)
        
        let indePath = collectionView.indexPathForItem(at: center)
        
        horizontalPickerVM.getArticleText(at: indePath?.row ?? 0)
    }
}

extension HorizontalPickerVC: UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    {
        if indexPath.row == horizontalPickerVM.getNumberOfArtcels()-1
        {
            horizontalPickerVM.getNextFiveArticles()
        }
    }
}

extension HorizontalPickerVC: HorizontalPickerVMDelegate
{
    func updatePicker() {
        self.collectionView.reloadData()
    }
}

protocol HorizontalPickerVMProtocol
{
    func getNumberOfArtcels() -> Int
    func getTitleForIndex(index: Int) -> String
    func getNextFiveArticles()
    func getArticleText(at index: Int)
}
