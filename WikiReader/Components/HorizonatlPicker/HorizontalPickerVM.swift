//
//  HorizontalPickerVM.swift
//  WikiReader
//
//  Created by Višeslav Šako on 28/08/2018.
//  Copyright © 2018 viseslav. All rights reserved.
//

import Foundation

class HorizontalPickerVM
{
    var titles: [String]
    let networkingService: NetworkingService
    weak var delegate: HorizontalPickerVMDelegate?
    var start = true
    var onStartText: (()->())?
    var onCompleteText: ((_ text: String)->())?

    init()
    {
        titles = [String]()
        networkingService = NetworkingService()
        getNextFiveArticles()
    }
}

extension HorizontalPickerVM: HorizontalPickerVMProtocol
{
    
    func getTitleForIndex(index: Int) -> String{
        return titles[index]
    }
    
    func getNumberOfArtcels() -> Int {
        return titles.count
    }
    
    func getNextFiveArticles()
    {
        networkingService.getRandomArticles { (articles) in
            if let articlesTitles = articles?.query.pages.values
            {
                for page in articlesTitles
                {
                    if !self.titles.contains(page.title)
                    {
                        self.titles.append(page.title)
                    }
                }
                self.delegate?.updatePicker()
                if self.start
                {
                    self.start = false
                    self.getArticleText(at: 0)
                }
            }
        }
    }
    
    func getArticleText(at index: Int)
    {
        self.onStartText!()
        networkingService.getArticleContetnt(title: titles[index]) { (content) in
            if let articles = content?.query.pages.values
            {
                for page in articles
                {
                    self.onCompleteText!(page.extract ?? "")
                }
            }else
            {
                self.onCompleteText!("")
            }
        }
    }
}

protocol HorizontalPickerVMDelegate: class
{
    func updatePicker()
}
