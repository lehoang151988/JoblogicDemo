
//
//  WeatherVC.swift
//  WeatherForecast
//
//  Created by Hoang Le on 16/12/2021.
//

import UIKit
import CoreLocation
import Alamofire

class HomeViewController: UIViewController {
    private var presenter: HomePresenter!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func callListTapped(_ sender: Any) {
        if let viewController  = UIStoryboard(name: "CallListViewController", bundle: nil).instantiateViewController(withIdentifier: "CallListViewController") as? CallListViewController {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    @IBAction func buyListTapped(_ sender: Any) {
        if let viewController  = UIStoryboard(name: "BuyListViewController", bundle: nil).instantiateViewController(withIdentifier: "BuyListViewController") as? BuyListViewController {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    @IBAction func sellListTapped(_ sender: Any) {
        if let viewController  = UIStoryboard(name: "SellListViewController", bundle: nil).instantiateViewController(withIdentifier: "SellListViewController") as? SellListViewController {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
