
//
//  WeatherVC.swift
//  WeatherForecast
//
//  Created by Hoang Le on 16/12/2021.
//

import UIKit
import CoreLocation
import Alamofire

class CallListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private var presenter: CallListPresenter!
    
    @IBOutlet weak var tableView: UITableView!
    var callListModels = [CallListModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CALL LIST"
        setupTableView()
        presenter = CallListPresenter(viewable: self, service: APICallService())
        loadData()
    }
    
    func loadData() {
        presenter.getCallListData()
        showLoading()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.register(UINib(nibName: "CallListCell", bundle: nil), forCellReuseIdentifier: "CallListCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return callListModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CallListCell", for: indexPath) as? CallListCell {
            let model = callListModels[indexPath.row]
            cell.configureCell(model: model)
            return cell
        } else {
            return CallListCell()
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

extension CallListViewController: CallListViewable {
    func updateMainUI(callListModels: [CallListModel]) {
        self.callListModels = callListModels
        tableView.reloadData()
        hideLoading()
    }
}
