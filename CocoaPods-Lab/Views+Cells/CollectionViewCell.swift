//
//  CollectionViewCell.swift
//  CocoaPods-Lab
//
//  Created by Kelby Mittan on 3/5/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit
import SnapKit


class CollectionViewCell: UICollectionViewCell {
    
    public lazy var userImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "photo.fill")
        return iv
    }()
    
    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Label"
        return label
    }()
    
    public lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone Number XXX-XXX-XXXX"
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
        setupUserImageConstraints()
//        setupNameLabelConstraints()
//        setupPhoneLabelConstraints()
    }
    
    private func setupUserImageConstraints() {
        addSubview(userImage)
        userImage.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalTo(self)
//            make.width.lessThanOrEqualTo(100)
        }
    }
    
    private func setupNameLabelConstraints() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(10)
            make.leading.equalTo(userImage).offset(10)
            make.trailing.equalTo(self).offset(-10)
        }
    }
    
    private func setupPhoneLabelConstraints() {
        addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel).offset(10)
            make.centerX.equalTo(nameLabel)
            make.width.equalTo(nameLabel)
        }
    }
}
