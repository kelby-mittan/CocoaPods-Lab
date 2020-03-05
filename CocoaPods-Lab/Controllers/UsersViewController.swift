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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usersView.backgroundColor = .systemTeal
    }
    


}
