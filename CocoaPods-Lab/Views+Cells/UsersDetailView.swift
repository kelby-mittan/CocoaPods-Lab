//
//  UsersDetailView.swift
//  CocoaPods-Lab
//
//  Created by Kelby Mittan on 3/5/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit

class UsersDetailView: UIView {

    public lazy var userImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "photo.fill")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = iv.frame.size.height/2
        return iv
    }()
    
    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Label"
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    
    public lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Address"
        label.numberOfLines = 3
        return label
    }()
    
    public lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone Number XXX-XXX-XXXX"
        return label
    }()
    
    public lazy var dobLabel: UILabel = {
        let label = UILabel()
        label.text = "DOB"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupNameLabel()
        setupImageConstraints()
        setupAddressConstraints()
        setupPhoneConstraints()
        setupDOBConstraints()
    }
    
    private func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (name) in
            name.top.leading.trailing.equalTo(self).inset(20)
        }
    }
    
    private func setupImageConstraints() {
        addSubview(userImage)
        userImage.snp.makeConstraints { (image) in
            image.top.equalTo(nameLabel).inset(60)
            image.centerX.equalTo(self.center)
            image.width.equalTo(self).multipliedBy(0.75)
            image.height.equalTo(self).multipliedBy(0.25)
        }
    }
    
    private func setupAddressConstraints() {
        addSubview(addressLabel)
        addressLabel.snp.makeConstraints { (address) in
            address.top.equalTo(userImage.snp.bottom).offset(20)
            address.leading.trailing.equalTo(self).inset(20)
        }
    }
    
    private func setupPhoneConstraints() {
        addSubview(numberLabel)
        numberLabel.snp.makeConstraints { (phone) in
            phone.top.equalTo(addressLabel.snp.bottom).offset(8)
            phone.leading.trailing.equalTo(self).inset(20)
        }
    }
    
    private func setupDOBConstraints() {
        addSubview(dobLabel)
        dobLabel.snp.makeConstraints { (dob) in
            dob.top.equalTo(numberLabel.snp.bottom).offset(8)
            dob.leading.trailing.equalTo(self).inset(20)
        }
    }

}
