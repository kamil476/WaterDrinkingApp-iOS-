//
//  AddDailyGoalVC.swift
//  WaterDrinking
//
//  Created by Kamil Kakar on 17/02/2025.
//

import UIKit

// (1)
//protocol DailyGoalAdded: AnyObject {
//    func dailyWaterGoal(value: String)
//}

class AddDailyGoalVC: UIViewController {
    
    private let vectorImage = CustomImageView(imageName: "Vector 1")
    private let vectorImage1 = CustomImageView(imageName: "Vector 1")
    private let vectorImage2 = CustomImageView(imageName: "Vector 2")
    private let vectorImages2 = CustomImageView(imageName: "Vector 2")
    private let slider = UISlider()
    private let valueLabel = UILabel()
    lazy var saveBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.setTitle("SAVE", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.titleLabel?.minimumScaleFactor = 0.5
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.isUserInteractionEnabled = true
        btn.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backGroundBlue
        setupHomeView()
    }
    
    private func setupHomeView(){
        view.addSubview(vectorImage)
        view.addSubview(vectorImage1)
        view.addSubview(vectorImage2)
        view.addSubview(vectorImages2)
        view.addSubview(valueLabel)
        view.addSubview(saveBtn)
        vectorImages2.addSubview(slider)
        
        valueLabel.font = UIFont.systemFont(ofSize: 28)
        valueLabel.textColor = .white
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        vectorImages2.transform = CGAffineTransform(scaleX: 1, y: -1)
        vectorImage1.transform = CGAffineTransform(scaleX: 1, y: -1)
        vectorImage2.transform = CGAffineTransform(scaleX: 1, y: -1)
        vectorImage.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        // Create and set up the slider
        slider.minimumValue = 0
        slider.maximumValue = 4000
        slider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slider)
        
        
        NSLayoutConstraint.activate([
            
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
            
            valueLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            valueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            saveBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            saveBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            slider.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            slider.widthAnchor.constraint(equalToConstant: 300),
            slider.heightAnchor.constraint(equalToConstant: 30),
            
        ])
        
        slider.addTarget(self, action: #selector(addGoalSliderValueChanged(_:)), for: .valueChanged)
    }
    
    // MARK: - Button Action
    @objc func saveButtonTapped() {
        UserDefaults.standard.setValue(valueLabel.text ?? "", forKey: "dailyWaterGoal")
        
        // (4) Pop back to ReceiverViewController
        navigationController?.popViewController(animated: true)
    }
    
    @objc func addGoalSliderValueChanged(_ sender: UISlider) {
        valueLabel.text = String(format: "%.0f", sender.value)
    }
    
}
