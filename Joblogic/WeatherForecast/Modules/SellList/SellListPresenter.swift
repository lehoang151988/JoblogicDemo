//
//  SellListPresenter.swift
//
//  Created by Hoang Le on 18/12/2021.
//

import Foundation
import Alamofire

protocol SellListViewable: class {
}

class SellListPresenter {
    unowned var viewable: SellListViewable
    
    init(viewable: SellListViewable) {
        self.viewable = viewable
    }
}
