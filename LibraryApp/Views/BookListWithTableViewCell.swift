//
//  BookListWithTableViewCell.swift
//  LibraryApp
//
//  Created by Kamshat Koszhanova on 10.12.2022.
//

import UIKit

class BookListWithTableViewCell: UITableViewCell {
    
    lazy private var bookListTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(BookListPageTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.BookListPageTableViewCell)
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        

        return tableView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 20
        
        bookListTableView.dataSource = self
        bookListTableView.delegate = self
//        bookListTableView.backgroundColor = .red
        
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

extension BookListWithTableViewCell: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.BookListPageTableViewCell, for: indexPath) as! BookListPageTableViewCell
        cell.backgroundColor = .clear
        return cell
    }
    
    func setupViews() {
        contentView.addSubview(bookListTableView)
    }
    
    func setupConstraints() {
        bookListTableView.snp.makeConstraints {
            make in
//            make.edges.equalToSuperview()
            make.top.equalToSuperview().inset(-5)
            make.bottom.equalToSuperview().inset(5)
            make.leading.trailing.equalToSuperview().inset(15)
            
        }
    }
}
