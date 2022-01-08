//
//  WeatherForecast
//
//  Created by Hoang Le on 16/12/2021.
//

import UIKit
import CoreData

class SellListCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    func configureCell(model: NSManagedObject) {
        if let name = model.value(forKeyPath: "name") as? String {
            nameLabel.text = "Name: \(name)"
        }
        
        if let price = model.value(forKeyPath: "price") as? String {
            priceLabel.text = "Price: \(price)"
        }
        
        if let quantity = model.value(forKeyPath: "quantity") as? String {
            quantityLabel.text = "Quantity: \(quantity)"
        }
    }
}
