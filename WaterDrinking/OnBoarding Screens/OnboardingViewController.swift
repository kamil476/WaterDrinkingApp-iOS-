//
//  OnboardingViewController.swift
//  WaterDrinking
//
//  Created by Kamil Kakar on 11/02/2025.
//


import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: - UI Elements
    private var collectionView: UICollectionView!
    private let nextButton = CustomButton(backgroundColor: UIColor(hex: "#5DCCFC"), title: "Next")
    private var pageControl: UIPageControl!
    
    // MARK: - PROPERTIES
    public let onboardingItems: [OnboardingItem] = [
        OnboardingItem(
            imageName: "screen1WaterDrink",
            title: "Track your daily water intake with Us.",
            subtitle: "Achieve your hydration goals with a simple tap!",
            buttonTitle: "Next",
            isLastItem: false
        ),
        OnboardingItem(
            imageName: "World water day-bro 1",
            title: "Smart Reminders Tailored to You",
            subtitle: "Quick and easy to set your hydration goal & then track your daily water intake progress.",
            buttonTitle: "Next",
            isLastItem: false
        ),
        OnboardingItem(
            imageName: "Bottle of water-rafiki 1",
            title: "Easy to Use – Drink, Tap, Repeat",
            subtitle: "Staying hydrated every day is easy with Drops Water Tracker.",
            buttonTitle: "Get Started",
            isLastItem: true
        )
    ]
    
    // MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupCollectionView()
    }
    
    // MARK: - Functions
    public func setupViews() {
        self.view.backgroundColor = .systemBackground
        
        // Set up nextButton
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        view.addSubview(nextButton)
        
        // Set up pageControl
        pageControl = UIPageControl()
        pageControl.numberOfPages = onboardingItems.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = UIColor(hex: "#5DCCFC")
        pageControl.pageIndicatorTintColor = .lightGray
        view.addSubview(pageControl)
        
        // Layout
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            
            pageControl.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -20),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    public func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(OnboardingCell.self, forCellWithReuseIdentifier: "OnboardingCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    public func updateActionButtonTitle(for item: OnboardingItem) {
        if item.isLastItem {
            nextButton.setTitle("Done", for: .normal)
        } else {
            nextButton.setTitle("Next", for: .normal)
        }
    }
    
    // MARK: - Actions
    @objc public func nextButtonTapped() {
        let currentIndex = pageControl.currentPage
        let item = onboardingItems[currentIndex]
        
        if item.isLastItem {
            let vc = SplashScreen()
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let nextIndex = currentIndex + 1
            let indexPath = IndexPath(item: nextIndex, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

// MARK: - UICollectionView DataSource & Delegate
extension OnboardingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as! OnboardingCell
        let item = onboardingItems[indexPath.item]
        cell.configure(with: item)
        updateActionButtonTitle(for: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.bounds.width
        let currentPage = Int((scrollView.contentOffset.x + (width / 2)) / width)
        pageControl.currentPage = currentPage
    }
}

