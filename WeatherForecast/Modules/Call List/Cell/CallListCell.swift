//
//  WeatherForecast
//
//  Created by Hoang Le on 16/12/2021.
//

import UIKit

class CallListCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    func configureCell(model: CallListModel) {
        nameLabel.text = "Name: \(model.name)"
        numberLabel.text = "Number: \(model.number)"
    }
}
