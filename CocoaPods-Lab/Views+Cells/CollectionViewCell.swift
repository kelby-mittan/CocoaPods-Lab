//
//  CollectionViewCell.swift
//  CocoaPods-Lab
//
//  Created by Kelby Mittan on 3/5/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    
    public lazy var userImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "photo.fill")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Label"
        label.textAlignment = .center
        label.backgroundColor = .systemBackground
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        return label
    }()
    
    public lazy var emailLabel: UILabel = {
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
        setupNameLabelConstraints()
        setupPhoneLabelConstraints()
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    private func setupUserImageConstraints() {
        addSubview(userImage)
        userImage.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(self).inset(25)
            make.top.bottom.equalTo(self).inset(25)
        }
    }
    
    private func setupNameLabelConstraints() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self).inset(5)
            make.leading.equalTo(self).inset(10)
            make.trailing.equalTo(self).inset(10)
        }
    }
    
    private func setupPhoneLabelConstraints() {
        addSubview(emailLabel)
        emailLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self).inset(5)
            make.centerX.equalTo(nameLabel)
            make.width.equalTo(nameLabel)
        }
    }
    
    public func configureCell(for user: User) {
        nameLabel.text = "\(user.name.last), \(user.name.first)"
        emailLabel.text = user.email
        
        guard let url = URL(string: user.picture.large) else {
            return
        }
        userImage.kf.setImage(with: url)
    }
    
    
}
