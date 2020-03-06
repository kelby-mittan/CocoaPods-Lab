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
    
    public var user: User
    
    init(_ user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy" //"EEEE, MMM d, yyyy h:mm a"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDetailView.backgroundColor = .systemBackground
        updateUI()
    }
    
    private func getDateFromString(dateString: String) -> Date? {
        let formatter = ISO8601DateFormatter()
           formatter.formatOptions = [.withDashSeparatorInDate,
                                      .withFullDate,
                                      .withColonSeparatorInTimeZone]
           guard let date = formatter.date(from: dateString) else {
             return nil
           }
           return date
    }
    
    private func updateUI() {
        userDetailView.nameLabel.text = "\(user.name.first) \(user.name.last)"
        
        guard let url = URL(string: user.picture.large) else {
            return
        }
        userDetailView.userImage.kf.setImage(with: url)
        userDetailView.userImage.clipsToBounds = true
        userDetailView.userImage.layer.cornerRadius = 80
        userDetailView.addressLabel.text = """
\(user.location.street.number) \(user.location.street.name)
\(user.location.city), \(user.location.state) \(user.location.postcode)
"""
        userDetailView.numberLabel.text = "Phone: \(user.phone)"
        
        guard let date = getDateFromString(dateString: user.dob.date) else {
            return
        }

        userDetailView.dobLabel.text = "DOB: \(dateFormatter.string(from: date))"
    }
}
