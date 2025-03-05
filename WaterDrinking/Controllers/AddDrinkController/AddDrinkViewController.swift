//
//  AddDrinkVC.swift
//  WaterDrinking
//
//  Created by Kaomil Kakar on 13/02/2025.
//

import UIKit

class AddDrinkViewController: UIViewController {
    
// MARK: - UI COMPONENETS
    var onWaterAdded: ((listOfDrinks) -> Void)?
    var onCoffeeAdded: ((listOfDrinks) -> Void)?
    var onTeaAdded: ((listOfDrinks) -> Void)?
    lazy var slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 500
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        return slider
    }()
    lazy var quantityLabel: UILabel = {
        let valLabel = UILabel()
        valLabel.font = UIFont.systemFont(ofSize: 24)
        valLabel.textColor = .black
        valLabel.translatesAutoresizingMaskIntoConstraints = false
        return valLabel
    }()
    private let glassImage = CustomImageView(imageName: "icons8-empty-glass-50")
    private let waveImage = CustomImageView(imageName: "Vector 1")
    lazy var checkMark: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "icons8-check-48"), for: .normal)
        btn.layer.cornerRadius = 10
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.2
        btn.layer.shadowOffset = CGSize(width: 1, height: 1)
        btn.layer.shadowRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(moveToHomeController), for: .touchUpInside)
        return btn
    }()
    var drinkType: DrinkType = .water
    
// MARK: - APP LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
// MARK: - FUNCTIONS
    private func setupViews(){
        view.addSubview(quantityLabel)
        view.addSubview(glassImage)
        view.addSubview(checkMark)
        view.addSubview(slider)
        
        NSLayoutConstraint.activate([
            quantityLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            quantityLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 160),
            slider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            slider.widthAnchor.constraint(equalToConstant: 400),
            slider.heightAnchor.constraint(equalToConstant: 100),
            
            glassImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            glassImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            glassImage.heightAnchor.constraint(equalToConstant: 200),
            glassImage.widthAnchor.constraint(equalToConstant: 200),
            
            checkMark.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            checkMark.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        quantityLabel.text = String(format: "%.0f", sender.value)
    }
    
    @objc func moveToHomeController() {
        let quantity = Int32(slider.value)
        
        // Creating the drink item based on the selected drink type
        //        CoreDataManager.shared.saveDrink(drinkDate: drinkType.rawValue, drinkName: drinkType.rawValue.capitalized, drinkImage: drinkType.rawValue, drinkQuantity: quantity, drinkType: drinkType.rawValue.capitalized)
        
        // Pass the current date to the drinkDate parameter
        CoreDataManager.shared.saveDrink(
            drinkDate: Date().stripTime(), // Stripe erases the time
            drinkName: drinkType.rawValue.capitalized,
            drinkImage: drinkType.rawValue,
            drinkQuantity: quantity,
            drinkType: drinkType.rawValue.capitalized
        )
        navigationController?.popViewController(animated: true)
    }
}

