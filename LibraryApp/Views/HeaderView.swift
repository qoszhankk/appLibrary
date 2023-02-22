//
//  HeaderView.swift
//  LibraryApp
//
//  Created by Kamshat Koszhanova on 25.11.2022.
//

import UIKit
import SnapKit

class HeaderView: UITableViewHeaderFooterView, UISearchBarDelegate {
    
    lazy private var greeting: UILabel = {
        let label = UILabel()
        label.text = "Hello,"
        label.font = UIFont(name: "HoeflerText-Black", size: 25)
        label.textColor = UIColor(red: 41/255, green: 80/255, blue: 148/255, alpha: 1)
//        label.textColor = UIColor(red: 90/255, green: 164/255, blue: 238/255, alpha: 1)
        return label
    }()
    lazy private var admin: UILabel = {
        let label = UILabel()
        label.text = "Kamshat"
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 30)
        label.textColor = UIColor(red: 90/255, green: 164/255, blue: 238/255, alpha: 1)
        return label
    }()
    lazy private var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logoImage")
        return image
    }()
    lazy private var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.searchBarStyle = UISearchBar.Style.minimal
        search.placeholder = "Search for Books..."
        search.sizeToFit()
        search.isTranslucent = false
        search.delegate = self
        return search
    }()
    
    override init(reuseIdentifier: String?) {
        super .init(reuseIdentifier: reuseIdentifier)
//        contentView.backgroundColor = .systemBlue
        setupViews()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension HeaderView {
    func setupViews() {
        contentView.addSubview(greeting)
        contentView.addSubview(admin)
        contentView.addSubview(searchBar)
        contentView.addSubview(logoImage)
    }
    func setupConstraints() {
        greeting.snp.makeConstraints {
            make in
            make.top.equalToSuperview().inset(50)
            make.leading.equalToSuperview().inset(25)
            make.bottom.equalTo(admin.snp.top)
        }
        admin.snp.makeConstraints {
            make in
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview().inset(25)
        }
        searchBar.snp.makeConstraints {
            make in
            make.bottom.equalTo(contentView.snp.bottom)
            make.top.equalTo(logoImage.snp.bottom).inset(20)
            make.leading.trailing.equalToSuperview().inset(25)
        }
        logoImage.snp.makeConstraints {
            make in
            make.top.equalToSuperview().inset(5)
            make.height.equalTo(170)
            make.width.equalTo(190)
            make.trailing.equalToSuperview().inset(10)
        }
    }
}
