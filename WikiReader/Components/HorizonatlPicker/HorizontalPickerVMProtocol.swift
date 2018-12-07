//
//  HorizontalPickerVMProtocol.swift
//  WikiReader
//
//  Created by Višeslav Šako on 07/12/2018.
//  Copyright © 2018 viseslav. All rights reserved.
//

import Foundation

protocol HorizontalPickerVMProtocol
{
    func getNumberOfArtcels() -> Int
    func getTitleForIndex(index: Int) -> String
    func getNextFiveArticles()
    func getArticleText(at index: Int)
}
