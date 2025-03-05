//
//  ViewController.swift
//  WaterDrinking
//
//  Created by Kamil Kakar on 10/02/2025.
//

import UIKit

class SplashScreen: UIViewController {
    
    
    // MARK: - PROPERTIES
    let splashScreen = CustomImageView(imageName: "waterDropLS")
    let loading = CustomImageView(imageName: "Loading")
    
    let scLabelOne = CustomLabel(text: "Drops Water Tracker", textColor: .white,font: UIFont.systemFont(ofSize: 28, weight: .heavy))
    let scLabelTwo = CustomLabel(text: "Stay hydrated and track daily water intake", textColor: .white,font: UIFont.systemFont(ofSize: 16, weight: .light))
    
    // MARK: - APP LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    // MARK: - CONSTRAINTS
    private func setupViews(){
        self.view.backgroundColor = UIColor(hex: "#5DCCFC")
        view.addSubview(splashScreen)
        view.addSubview(scLabelOne)
        view.addSubview(scLabelTwo)
        view.addSubview(loading)
        
        NSLayoutConstraint.activate([
            splashScreen.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            splashScreen.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            
            loading.topAnchor.constraint(equalTo: scLabelTwo.bottomAnchor, constant: 20),
            loading.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -245),
            loading.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 175),
            loading.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -175),
            
            scLabelOne.topAnchor.constraint(equalTo: splashScreen.bottomAnchor, constant: 10),
            scLabelOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 58),
            scLabelOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -56),
            
            scLabelTwo.topAnchor.constraint(equalTo: scLabelOne.bottomAnchor, constant: 10),
            scLabelTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            scLabelTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            scLabelTwo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -280),
        ])
    }
}

