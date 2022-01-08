//
//  WeatherForecast
//
//  Created by Hoang Le on 16/12/2021.
//

import UIKit

class BuyListCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    func configureCell(model: BuyListModel) {
        nameLabel.text = "Name: \(model.name)"
        priceLabel.text = "Price: \(model.price)"
        quantityLabel.text = "Quantity: \(model.quantity)"
    }
}
