//
//  WeatherService.swift
//  WeatherForecast
//
//  Created by Hoang Le on 18/12/2021.
//

import Foundation
import Alamofire

protocol DataProvider {
    func getCallListData(completed: @escaping CallListDataCompletion)
    func getBuyListData(completed: @escaping BuyListDataCompletion)
}

class APICallService: DataProvider {
    func getCallListData(completed: @escaping CallListDataCompletion) {
        guard let url = URL(string: "\(CALL_LIST_URL)") else { return }
    
        Alamofire.request(url).responseJSON { response in
            if let error = response.error {
                completed(nil, error)
                return
            }

            let result = response.result
            var data = [CallListModel]()
            if let list = result.value as? [Dictionary<String, AnyObject>] {
                for obj in list {
                    let callListModel = CallListModel(dict: obj)
                    data.append(callListModel)
                }
            }
            completed(data, nil)
        }
    }
    
    func getBuyListData(completed: @escaping BuyListDataCompletion) {
        guard let url = URL(string: "\(BUY_LIST_URL)") else { return }
    
        Alamofire.request(url).responseJSON { response in
            if let error = response.error {
                completed(nil, error)
                return
            }

            let result = response.result
            var data = [BuyListModel]()
            if let list = result.value as? [Dictionary<String, AnyObject>] {
                for obj in list {
                    let buyListModel = BuyListModel(dict: obj)
                    data.append(buyListModel)
                }
            }
            completed(data, nil)
        }
    }
}
