//
//  Constants.swift
//  WeatherForecast
//
//  Created by Hoang Le on 16/12/2021.
//

import Foundation

typealias  downloadComplete = () -> ()
typealias CallListDataCompletion = ([CallListModel]?, Error?) -> Void
typealias BuyListDataCompletion = ([BuyListModel]?, Error?) -> Void

let CALL_LIST_URL = "https://my-json-server.typicode.com/imkhan334/demo-1/call"
let BUY_LIST_URL = "https://my-json-server.typicode.com/imkhan334/demo-1/buy"
