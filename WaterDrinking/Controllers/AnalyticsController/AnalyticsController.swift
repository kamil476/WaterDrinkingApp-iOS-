//
//  AnalyticsControllessss.swift
//  WaterDrinking
//
//  Created by Kamil Kakar on 02/02/2025.
//

import UIKit

class AnalyticsController: UIViewController {
    
// MARK: - UI COMPONENETS
    lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
        tableview.register(AnalyticsTableViewCell.self, forCellReuseIdentifier: "AnalyticsTableViewCell")
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    private var drinksByDate: [(date: String, drinks: [listOfSavedDrinks])] = []
    
// MARK: - APP LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchDrinks()
    }
    
// MARK: - FUNCTIONS
    private func setupTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func fetchDrinks() {
        if let fetchedDrinks = CoreDataManager.shared.fetchAllDrinks() {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            
            // Group drinks by date
            let groupedDrinks = Dictionary(grouping: fetchedDrinks) { drink in
                return dateFormatter.string(from: drink.drinkDate ?? Date())
            }
            drinksByDate = groupedDrinks.map { (date, drinks) in
                return (date, drinks.map { drink in
                    listOfSavedDrinks(
                        drinkImage: drink.drinkImage ?? "",
                        drinkName: drink.drinkName ?? "",
                        drinkQuantity: String(drink.drinkQuantity),
                        drinkDate: date
                    )
                })
                // Sorting by latest
            }.sorted { $0.date > $1.date }
            tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension AnalyticsController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return drinksByDate.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnalyticsTableViewCell", for: indexPath) as! AnalyticsTableViewCell
        let sectionData = drinksByDate[indexPath.section]
        cell.configure(with: sectionData.date, drinks: sectionData.drinks)
        return cell
    }
}
