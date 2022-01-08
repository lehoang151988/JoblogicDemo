//
//
//  Created by Hoang Le on 16/12/2021.
//

class BuyListModel {
    private var _name:String!
    private var _price: Int!
    private var _quantity: Int!
    private var _type: Int!
    
    var name: String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    
    var price: Int {
        if _price == nil {
            _price = 0
        }
        return _price
    }
    
    var quantity: Int {
        if _quantity == nil {
            _quantity = 0
        }
        return _quantity
    }
    
    var type: Int {
        if _type == nil {
            _type = 0
        }
        return _type
    }
    
    init(dict: Dictionary<String, AnyObject>) {
        if let name = dict["name"] as? String {
            self._name = "\(name)"
        }

        if let price = dict["price"] as? Int {
            self._price = price
        }
        
        if let quantity = dict["quantity"] as? Int {
            self._quantity = quantity
        }
        
        if let type = dict["type"] as? Int {
            self._type = type
        }
    }
}
