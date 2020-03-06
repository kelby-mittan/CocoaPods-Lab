//
//  UserDetailController.swift
//  CocoaPods-Lab
//
//  Created by Kelby Mittan on 3/5/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit

class UserDetailController: UIViewController {

    let userDetailView = UsersDetailView()
    
    override func loadView() {
        view = userDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userDetailView.backgroundColor = .orange
    }
    
    public var user: User
    
    init(_ user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
