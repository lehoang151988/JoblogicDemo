//
//
//  Created by Hoang Le on 16/12/2021.
//

class CallListModel {
    private var _name:String!
    private var _number: String!
    
    var name: String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    
    var number: String {
        if _number == nil {
            _number = ""
        }
        return _number
    }
    
    init(dict: Dictionary<String, AnyObject>) {
        if let name = dict["name"] as? String {
            self._name = "\(name)"
        }

        if let number = dict["number"] as? String {
            self._number = "\(number)"
        }
    }
}
