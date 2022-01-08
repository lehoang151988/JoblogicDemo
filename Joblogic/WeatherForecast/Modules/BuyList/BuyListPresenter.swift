//
//  BuyListPresenter.swift
//
//  Created by Hoang Le on 18/12/2021.
//

import Foundation
import Alamofire

protocol BuyListViewable: class {
    func updateMainUI(buyListModels: [BuyListModel])
}

class BuyListPresenter {
    unowned var viewable: BuyListViewable
    let buyListService: DataProvider!
    
    init(viewable: BuyListViewable, service: DataProvider) {
        self.viewable = viewable
        self.buyListService = service
    }
    
    func getBuyListData() {
        buyListService.getBuyListData() { [weak self] (buyListModels, error)  in
            self?.viewable.updateMainUI(buyListModels: buyListModels ?? [])
        }
    }
}
