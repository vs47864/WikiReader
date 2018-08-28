//
//  MainViewModel.swift
//  WikiReader
//
//  Created by Višeslav Šako on 28/08/2018.
//  Copyright © 2018 viseslav. All rights reserved.
//

import Foundation

class MainViewModel
{
    var horizonalPickerVM: HorizontalPickerVM!
}

extension MainViewModel: MainVMProtocol
{
    func getTitle() -> String {
        return Constants.title
    }
}
