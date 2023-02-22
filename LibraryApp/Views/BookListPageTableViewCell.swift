//
//  BookListPageTableViewCell.swift
//  LibraryApp
//
//  Created by Kamshat Koszhanova on 10.12.2022.
//

import UIKit

class BookListPageTableViewCell: UITableViewCell {
    
    
    lazy private var bookListImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "readingBook")
        image.isUserInteractionEnabled = true
        return image
    }()
    
    lazy private var bookTitle: UILabel = {
        let label = UILabel()
        label.text = "book name"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 2
        label.textColor = UIColor(red: 41/255, green: 80/255, blue: 148/255, alpha: 1)
        return label
    }()
    
    lazy private var bookAuthor: UILabel = {
        let label = UILabel()
        label.text = "Agatha Christie"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 2
        label.textColor = .systemGray
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }

}

extension BookListPageTableViewCell {
    func setupViews() {
        contentView.addSubview(bookListImage)
        contentView.addSubview(bookTitle)
        contentView.addSubview(bookAuthor)
    }
    func setupConstraints() {
        
        bookListImage.snp.makeConstraints {
            make in
            make.top.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(-40)
            make.width.equalTo(120)
            make.height.equalTo(150)
        }
        bookTitle.snp.makeConstraints {
            make in
            make.top.equalToSuperview().inset(50)
            make.leading.equalTo(bookListImage.snp.trailing)
        }
        bookAuthor.snp.makeConstraints {
            make in
            make.top.equalTo(bookTitle.snp.bottom).inset(20)
            make.leading.equalTo(bookListImage.snp.trailing)
            make.bottom.equalToSuperview().inset(15)
        }
    }
}
