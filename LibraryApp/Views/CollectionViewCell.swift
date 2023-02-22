//
//  CollectionViewCell.swift
//  LibraryApp
//
//  Created by Kamshat Koszhanova on 26.11.2022.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
   
    lazy private var bookImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "book")
        image.isUserInteractionEnabled = true
        return image
    }()
    
    lazy private var bookTitle: UILabel = {
        let label = UILabel()
        label.text = "book name"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 2
        label.textColor = UIColor(red: 41/255, green: 80/255, blue: 148/255, alpha: 1)
        return label
    }()
    
    lazy private var bookAuthor: UILabel = {
        let label = UILabel()
        label.text = "Agatha Christie"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.numberOfLines = 2
        label.textColor = .systemGray
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        contentView.backgroundColor = .red
        setupViews()
        setupConstraints()
        
       
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension CollectionViewCell {
    func setupViews() {
        contentView.addSubview(bookImage)
        contentView.addSubview(bookTitle)
        contentView.addSubview(bookAuthor)
       
    }
    
    func setupConstraints() {
        bookImage.snp.makeConstraints {
            make in
            make.top.equalToSuperview().inset(60)
            make.leading.equalToSuperview().inset(-20)
            make.trailing.equalToSuperview().inset(-20)
            make.bottom.equalToSuperview()
        }
        bookTitle.snp.makeConstraints {
            make in
            make.top.equalTo(bookImage.snp.bottom).inset(20)
            make.leading.trailing.equalToSuperview().inset(5)
        }
        bookAuthor.snp.makeConstraints {
            make in
            make.top.equalTo(bookTitle.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(5)
            make.bottom.equalToSuperview().inset(-10)

        }
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView

        // Your action
    }
}
