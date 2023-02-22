//
//  BookShelvesControllerViewCell.swift
//  LibraryApp
//
//  Created by Kamshat Koszhanova on 26.11.2022.
//

import UIKit
import SnapKit

class BookShelvesCollectionViewTableViewCell: UITableViewCell {
    lazy private var headTitle: UILabel = {
        let label = UILabel()
        label.text = "New Arrivals"
        label.font = UIFont(name: "HoeflerText-Black", size: 25)
        label.textColor = UIColor(red: 41/255, green: 80/255, blue: 148/255, alpha: 1)
        return label
    }()
    lazy private var viewAllLabel: UILabel = {
        let label = UILabel()
        label.text = "View all >"
        label.textColor = UIColor(red: 90/255, green: 164/255, blue: 238/255, alpha: 1)
        return label
    }()

    lazy private var libraryCollectionView: UICollectionView =  {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 105, height: 235)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.CollectionViewCell)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        libraryCollectionView.dataSource = self
//        libraryCollectionView.backgroundColor = .blue
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension BookShelvesCollectionViewTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = libraryCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.CollectionViewCell, for: indexPath) as! CollectionViewCell
        return cell
    }
}
extension BookShelvesCollectionViewTableViewCell {
    func setupViews() {
        contentView.addSubview(headTitle)
        contentView.addSubview(viewAllLabel)
        contentView.addSubview(libraryCollectionView)
  
    }
    func setupConstraints() {
        headTitle.snp.makeConstraints {
            make in
            make.top.equalToSuperview().inset(5)
            make.leading.equalToSuperview().inset(25)
        }
        viewAllLabel.snp.makeConstraints {
            make in
            make.trailing.equalToSuperview().inset(30)
            make.bottom.equalTo(libraryCollectionView.snp.top).inset(100)
        }
        libraryCollectionView.snp.makeConstraints {
            make in
            make.leading.trailing.equalToSuperview().inset(25)
            make.top.equalToSuperview().inset(-75)
            make.bottom.equalToSuperview()
         
        }
    }
}
