//
//  HomeViewController.swift
//  WaterDrinking
//
//  Created by Kamil Kakar on 11/02/2025.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var drinkLimitLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 38, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var updatedDailyGoal: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 38, weight: .bold)
        label.textColor = .blueText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(WaterIntakeCell.self, forCellWithReuseIdentifier: "WaterIntakeCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    private let vectorImage = CustomImageView(imageName: "Vector 1")
    private let vectorImage1 = CustomImageView(imageName: "Vector 1")
    private let vectorImage2 = CustomImageView(imageName: "Vector 2")
    private let vectorImages2 = CustomImageView(imageName: "Vector 2")
    private let addDrinkLabel = CustomLabel(text: "ADD DRINK", textColor: .customBlue, font: UIFont.systemFont(ofSize: 10, weight: .semibold))
    private let bottomSheetView = UIView()
    lazy var teaIcon: UIButton = {
        let btn = UIButton()
        if let image = UIImage(named: "tea") {
            btn.setImage(image, for: .normal)
        }
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector (addTea), for: .touchUpInside)
        return btn
    }()
    
    private let teaLabel = CustomLabel(text: "TEA", textColor: .gray, font: UIFont.systemFont(ofSize: 11, weight: .bold))
    lazy var coffeeIcon: UIButton = {
        let btn = UIButton()
        if let image = UIImage(named: "coffee") {
            btn.setImage(image, for: .normal)
        }
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector (addCoffee), for: .touchUpInside)
        return btn
    }()
    private let coffeeLabel = CustomLabel(text: "COFFEE", textColor: .gray, font: UIFont.systemFont(ofSize: 11, weight: .bold))
    lazy var waterIcon: UIButton = {
        let btn = UIButton()
        if let image = UIImage(named: "water") {
            btn.setImage(image, for: .normal)
        }
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector (addWater), for: .touchUpInside)
        return btn
    }()
    private let waterLabel = CustomLabel(text: "WATER", textColor: .gray, font: UIFont.systemFont(ofSize: 11, weight: .bold))
    lazy var addDrinkBtn: UIButton = {
        let btn = UIButton()
        if let image = UIImage(named: "addIcon") {
            btn.setImage(image, for: .normal)
        }
        btn.layer.cornerRadius = 10
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.2
        btn.layer.shadowOffset = CGSize(width: 1, height: 1)
        btn.layer.shadowRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(showBottomSheet), for: .touchUpInside)
        return btn
    }()
    lazy var weeklyButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.setTitle("TODAY", for: .normal)
        btn.setTitleColor(.blueText, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.titleLabel?.minimumScaleFactor = 0.5
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    private var latestDrankItem: [listOfDrinks] = []
    
    // MARK: - APP LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpHomeViews()
        setupBottomSheet()
        setupCollectionView()
        initialDailyGoal()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updatedGoal()
        currentDayData()
    }
    
    // MARK: - FUNCTION
    private func setUpHomeViews(){
        view.addSubview(addDrinkBtn)
        view.addSubview(addDrinkLabel)
        view.addSubview(vectorImage)
        view.addSubview(vectorImage1)
        view.addSubview(vectorImage2)
        view.addSubview(vectorImages2)
        view.addSubview(weeklyButton)
        view.addSubview(updatedDailyGoal)
        view.addSubview(drinkLimitLabel)

        vectorImages2.transform = CGAffineTransform(scaleX: 1, y: -1)
        vectorImage1.transform = CGAffineTransform(scaleX: 1, y: -1)
        vectorImage2.transform = CGAffineTransform(scaleX: 1, y: -1)
        vectorImage.transform = CGAffineTransform(scaleX: 1, y: -1)
        addDrinkBtn.tintColor = UIColor.backGroundBlue
        
        NSLayoutConstraint.activate([
            addDrinkBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.widthRatio),
            addDrinkBtn.heightAnchor.constraint(equalToConstant: 50.autoSized),
            addDrinkBtn.widthAnchor.constraint(equalToConstant: 50.widthRatio),
            
            addDrinkLabel.topAnchor.constraint(equalTo: addDrinkBtn.bottomAnchor, constant: 2),
            addDrinkLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            
            vectorImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            vectorImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            vectorImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            vectorImage.heightAnchor.constraint(equalToConstant: 250),
            
            vectorImage1.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            vectorImage1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            vectorImage1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            vectorImage1.heightAnchor.constraint(equalToConstant: 250),
            
            vectorImage2.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            vectorImage2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            vectorImage2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            vectorImage2.heightAnchor.constraint(equalToConstant: 230),
            
            vectorImages2.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            vectorImages2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            vectorImages2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            vectorImages2.heightAnchor.constraint(equalToConstant: 230),
            
            weeklyButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            weeklyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            addDrinkBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
            addDrinkBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            updatedDailyGoal.topAnchor.constraint(equalTo: weeklyButton.bottomAnchor, constant: 5),
            updatedDailyGoal.leadingAnchor.constraint(equalTo: drinkLimitLabel.trailingAnchor, constant: 6),
            updatedDailyGoal.trailingAnchor.constraint(equalTo: weeklyButton.trailingAnchor),
            
            drinkLimitLabel.topAnchor.constraint(equalTo: weeklyButton.bottomAnchor, constant: 5),
            drinkLimitLabel.trailingAnchor.constraint(equalTo: updatedDailyGoal.leadingAnchor, constant: -6),
            drinkLimitLabel.leadingAnchor.constraint(equalTo: weeklyButton.leadingAnchor),
        ])
    }
    
    private func currentDayData(){
        if let drinks = CoreDataManager.shared.fetchTodayDrinks() {
            latestDrankItem = drinks.map { drink in
                return listOfDrinks(
                    drinkImage: drink.drinkImage ?? "",
                    drinkName: drink.drinkName ?? "",
                    drinkQuantity: String(drink.drinkQuantity)
                )
            }
            updateDrinkLimitLabel()
            collectionView.reloadData()
        }
    }
    
    private func initialDailyGoal(){
        if UserDefaults.standard.string(forKey: "dailyWaterGoal") == nil {
            UserDefaults.standard.set("2000", forKey: "dailyWaterGoal")
        }
    }
    
    private func updatedGoal(){
        if let savedGoal = UserDefaults.standard.string(forKey: "dailyWaterGoal") {
            updatedDailyGoal.text = savedGoal
        }
    }
    
    private func updateDrinkLimitLabel() {
        let totalConsumed = latestDrankItem.reduce(0) { sum, drink in
            if let quantity = Int(drink.drinkQuantity) {
                return sum + quantity
            }
            return sum
        }
        drinkLimitLabel.text = "\(totalConsumed)"
    }
    
    private func setupCollectionView(){
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: vectorImages2.bottomAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: addDrinkBtn.topAnchor, constant: -2),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func setupBottomSheet(){
        view.addSubview(bottomSheetView)
        addDismissGesture()
        bottomSheetView.addSubview(waterIcon)
        bottomSheetView.addSubview(waterLabel)
        bottomSheetView.addSubview(coffeeIcon)
        bottomSheetView.addSubview(coffeeLabel)
        bottomSheetView.addSubview(teaIcon)
        bottomSheetView.addSubview(teaLabel)
        bottomSheetView.backgroundColor = .white
        bottomSheetView.layer.cornerRadius = 12
        bottomSheetView.layer.shadowColor = UIColor.black.cgColor
        bottomSheetView.layer.shadowOpacity = 0.2
        bottomSheetView.layer.shadowOffset = CGSize(width: 0, height: -3)
        bottomSheetView.layer.shadowRadius = 5
        bottomSheetView.frame = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: 300)
        
        NSLayoutConstraint.activate([
            waterIcon.topAnchor.constraint(equalTo: bottomSheetView.topAnchor, constant: 25),
            waterIcon.leadingAnchor.constraint(equalTo: bottomSheetView.leadingAnchor, constant: 18),
            
            waterLabel.topAnchor.constraint(equalTo: waterIcon.bottomAnchor, constant: 4),
            waterLabel.leadingAnchor.constraint(equalTo: bottomSheetView.leadingAnchor, constant: 18),
            
            coffeeIcon.topAnchor.constraint(equalTo: bottomSheetView.topAnchor, constant: 20),
            coffeeIcon.leadingAnchor.constraint(equalTo: waterIcon.trailingAnchor, constant: 25),
            
            coffeeLabel.topAnchor.constraint(equalTo: coffeeIcon.bottomAnchor, constant: 1),
            coffeeLabel.leadingAnchor.constraint(equalTo: waterLabel.trailingAnchor, constant: 25),
            
            teaIcon.topAnchor.constraint(equalTo: bottomSheetView.topAnchor, constant: 10),
            teaIcon.leadingAnchor.constraint(equalTo: coffeeIcon.trailingAnchor, constant: 25),
            
            teaLabel.topAnchor.constraint(equalTo: teaIcon.bottomAnchor, constant: 0),
            teaLabel.leadingAnchor.constraint(equalTo: coffeeLabel.trailingAnchor, constant: 50)
        ])
    }
    
    private func addDismissGesture() {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(dismissBottomSheet))
        swipeGesture.direction = .down
        bottomSheetView.addGestureRecognizer(swipeGesture)
    }
    
    // MARK: - ACTIONS
    @objc func showBottomSheet(){
        setupBottomSheet()
        UIView.animate(withDuration: 0.5, animations: {
            self.bottomSheetView.frame.origin.y = self.view.frame.height - 300
        })
    }
    
    @objc func addWater() {
        let addWaterVC = AddDrinkViewController()
        addWaterVC.drinkType = .water
        
        addWaterVC.onWaterAdded = { newWaterDrink in
            self.latestDrankItem.insert(newWaterDrink, at: 0)
            let totalWaterConsumed = self.latestDrankItem.reduce(0) { (sum, drink) in
                if let quantity = Int(drink.drinkQuantity) {
                    return sum + quantity
                }
                return sum
            }
            self.drinkLimitLabel.text = "\(totalWaterConsumed)"
            self.collectionView.reloadData()
        }
        navigationController?.pushViewController(addWaterVC, animated: true)
        dismissBottomSheet()
    }
    
    @objc func addCoffee() {
        let addCoffeeVC = AddDrinkViewController()
        addCoffeeVC.drinkType = .coffee
        
        addCoffeeVC.onCoffeeAdded = { newCoffeeDrink in
            self.latestDrankItem.insert(newCoffeeDrink, at: 0)
            let totalCoffeeConsumed = self.latestDrankItem.reduce(0) { (sum, drink) in
                if let quantity = Int(drink.drinkQuantity) {
                    return sum + quantity
                }
                return sum
            }
            self.drinkLimitLabel.text = "\(totalCoffeeConsumed)"
            self.collectionView.reloadData()
        }
        navigationController?.pushViewController(addCoffeeVC, animated: true)
        dismissBottomSheet()

    }
    
    @objc func addTea() {
        let addTeaVC = AddDrinkViewController()
        addTeaVC.drinkType = .tea
        
        addTeaVC.onTeaAdded = { newTeaDrink in
            self.latestDrankItem.insert(newTeaDrink, at: 0)
            let totalTeaConsumed = self.latestDrankItem.reduce(0) { (sum, drink) in
                if let quantity = Int(drink.drinkQuantity) {
                    return sum + quantity
                }
                return sum
            }
            self.drinkLimitLabel.text = "\(totalTeaConsumed)"
            self.collectionView.reloadData()
        }
        
        navigationController?.pushViewController(addTeaVC, animated: true)
        dismissBottomSheet()

    }
    
    @objc func dismissBottomSheet() {
        UIView.animate(withDuration: 0.5, animations: {
            self.bottomSheetView.frame.origin.y = self.view.frame.height
        })
    }
}


// MARK: - UICollectionView DataSource & Delegate
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return latestDrankItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WaterIntakeCell", for: indexPath) as! WaterIntakeCell
        let item = latestDrankItem[indexPath.row]
        cell.configure(with: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing: CGFloat = 20
        let itemWidth = (collectionView.bounds.width - totalSpacing) / 3.5
        let itemHeight: CGFloat = 80
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
