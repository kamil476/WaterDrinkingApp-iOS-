//
//  SettingsVC.swift
//  WaterDrinking
//
//  Created by Kamil Kakar on 17/02/2025.
//

import UIKit

//protocol getValue{
//    func indexValue(value: String)
//}

class SettingsVC: UIViewController {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(SettingsTBCell.self, forCellReuseIdentifier: "SettingsTBCell")
        return table
    }()
    
//    var getValueDelegate: getValue?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backGroundBlue
        setupTableView()
    }
    
    private func setupTableView(){
        tableView.register(SettingsTBCell.self, forCellReuseIdentifier: "SettingsTBCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTBCell", for: indexPath) as! SettingsTBCell
        cell.configure()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addDailyGoalVC = AddDailyGoalVC()
//        addDailyGoalVC.delegate = self
        navigationController?.pushViewController(addDailyGoalVC, animated: true)
    }
}

//extension SettingsVC: DailyGoalAdded {
//    func dailyWaterGoal(value: String) {
//        getValueDelegate?.indexValue(value: value)
//    }
//}
