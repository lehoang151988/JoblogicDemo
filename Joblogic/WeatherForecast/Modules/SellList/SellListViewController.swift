
//
//  WeatherVC.swift
//  WeatherForecast
//
//  Created by Hoang Le on 16/12/2021.
//

import UIKit
import CoreData
import Alamofire

class SellListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SellListViewable {
    private var presenter: SellListPresenter!
    var deviceList: [NSManagedObject] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SELL LIST"
        setupTableView()
        presenter = SellListPresenter(viewable: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Device")
        
        do {
            deviceList = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createDB()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.register(UINib(nibName: "SellListCell", bundle: nil), forCellReuseIdentifier: "SellListCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deviceList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SellListCell", for: indexPath) as? SellListCell {
            let model = deviceList[indexPath.row]
            cell.configureCell(model: model)
            return cell
        } else {
            return SellListCell()
        }
    }
    
    func createDB() {
        save(name: "Table", price: "12000", quantity: "1", type: "2")
        save(name: "TV", price: "38000", quantity: "2", type: "2")
        save(name: "iPhone X", price: "150000", quantity: "1", type: "2")
        self.tableView.reloadData()
    }
    
    func save(name: String, price: String, quantity: String, type: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Device", in: managedContext)!
        let device = NSManagedObject(entity: entity, insertInto: managedContext)
        device.setValue(name, forKeyPath: "name")
        device.setValue(price, forKeyPath: "price")
        device.setValue(quantity, forKeyPath: "quantity")
        device.setValue(type, forKeyPath: "type")
        
        do {
            try managedContext.save()
            self.deviceList.append(device)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
