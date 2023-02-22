//
//  ProfileHeaderView.swift
//  LibraryApp
//
//  Created by Kamshat Koszhanova on 10.12.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    lazy private var admin: UILabel = {
        let label = UILabel()
        label.text = "Kamshat"
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 30)
        label.textColor = UIColor(red: 90/255, green: 164/255, blue: 238/255, alpha: 1)
        return label
    }()
    lazy private var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logoImage2")
        
        return image
    }()
    
    lazy private var title: UILabel = {
        let label = UILabel()
        label.text = "Reading Now"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.numberOfLines = 2
        label.textColor = UIColor(red: 41/255, green: 80/255, blue: 148/255, alpha: 1)
        return label
    }()

    override init(reuseIdentifier: String?) {
        super .init(reuseIdentifier: reuseIdentifier)
//        contentView.backgroundColor = .systemBlue
        logoImage.backgroundColor = UIColor(red: 236/255, green: 241/255, blue: 250/255, alpha: 1)
        logoImage.layer.cornerRadius = 60
        setupViews()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileHeaderView {
    func setupViews() {
        contentView.addSubview(admin)
        contentView.addSubview(logoImage)
        contentView.addSubview(title)

    }
    func setupConstraints() {
        
        title.snp.makeConstraints {
            make in
            make.top.equalToSuperview().inset(235)
//            make.bottom.equalToSuperview().inset(-30)
            make.leading.equalToSuperview().inset(25)
        }
        
        admin.snp.makeConstraints {
            make in
            make.top.equalTo(logoImage.snp.bottom).inset(10)
            make.bottom.equalToSuperview().inset(-20)
            make.trailing.equalToSuperview().inset(130)
//            make.leading.equalToSuperview().inset(25)
        }
    
        logoImage.snp.makeConstraints {
            make in
            make.top.equalToSuperview().inset(80)
            make.bottom.equalToSuperview().inset(30)
            make.trailing.equalToSuperview().inset(130)
            make.height.equalTo(100)
            make.width.equalTo(130)
            
        }
    }
}
