//
//  CallListPresenter.swift
//
//  Created by Hoang Le on 18/12/2021.
//

import Foundation
import Alamofire

protocol CallListViewable: class {
    func updateMainUI(callListModels: [CallListModel])
}

class CallListPresenter {
    unowned var viewable: CallListViewable
    let callListService: DataProvider!
    
    init(viewable: CallListViewable, service: DataProvider) {
        self.viewable = viewable
        self.callListService = service
    }
    
    func getCallListData() {
        callListService.getCallListData() { [weak self] (callListModels, error)  in
            self?.viewable.updateMainUI(callListModels: callListModels ?? [])
        }
    }
}
