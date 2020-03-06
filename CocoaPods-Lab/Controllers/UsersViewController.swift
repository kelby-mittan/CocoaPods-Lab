//
//  UsersViewController.swift
//  CocoaPods-Lab
//
//  Created by Kelby Mittan on 3/5/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {

    let usersView = UsersCollectionView()
    
    override func loadView() {
        view = usersView
    }
    
    private var randomUsers = [User]() {
        didSet {
            usersView.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usersView.backgroundColor = .systemTeal
        usersView.collectionView.dataSource = self
        usersView.collectionView.delegate = self
        usersView.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cvCell")
        loadRandomUsers()
    }
    
    private func loadRandomUsers() {
        APIClient.fetchUsers { [weak self] (result) in
            switch result {
            case .failure(let error):
                print("no users: \(error)")
            case .success(let userArr):
                DispatchQueue.main.async {
                    self?.randomUsers = userArr
                }
            }
        }
    }


}

extension UsersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomUsers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = usersView.collectionView.dequeueReusableCell(withReuseIdentifier: "cvCell", for: indexPath) as? CollectionViewCell else {
            fatalError("could not deque cell")
        }
        
        
        cell.backgroundColor = .orange
        return cell
    }
    
    
}

extension UsersViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize: CGSize = UIScreen.main.bounds.size
        
        let spacingBetweenItems: CGFloat = 11
        
        let numberOfItems: CGFloat = 2
        
        let totalSpacing: CGFloat = (2 * spacingBetweenItems) + (numberOfItems - 1) * spacingBetweenItems
        
        let itemWidth: CGFloat = (maxSize.width - totalSpacing) / numberOfItems
        
        let itemHeight: CGFloat = maxSize.height * 0.20
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
