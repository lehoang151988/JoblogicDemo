
//
//  WeatherVC.swift
//  WeatherForecast
//
//  Created by Hoang Le on 16/12/2021.
//

import UIKit
import CoreLocation
import Alamofire

class BuyListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private var presenter: BuyListPresenter!
    
    @IBOutlet weak var tableView: UITableView!
    var buyListModels = [BuyListModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "BUY LIST"
        setupTableView()
        presenter = BuyListPresenter(viewable: self, service: APICallService())
        loadData()
    }
    
    func loadData() {
        presenter.getBuyListData()
        showLoading()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.register(UINib(nibName: "BuyListCell", bundle: nil), forCellReuseIdentifier: "BuyListCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buyListModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BuyListCell", for: indexPath) as? BuyListCell {
            let model = buyListModels[indexPath.row]
            cell.configureCell(model: model)
            return cell
        } else {
            return BuyListCell()
        }
    }
    
    func showLoading() {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
    func hideLoading() {
        dismiss(animated: false, completion: nil)
    }
}

extension BuyListViewController: BuyListViewable {
    func updateMainUI(buyListModels: [BuyListModel]) {
        self.buyListModels = buyListModels
        tableView.reloadData()
        hideLoading()
    }
}
