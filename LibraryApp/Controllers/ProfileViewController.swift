//
//  ProfileViewController.swift
//  LibraryApp
//
//  Created by Kamshat Koszhanova on 03.12.2022.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {

    lazy var profileTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor(red: 210/255, green: 227/255, blue: 255/255, alpha: 1)
        tableView.tableHeaderView = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 235))
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.showsHorizontalScrollIndicator = false
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileTableView.dataSource = self
        profileTableView.delegate = self
        setupViews()
        setupConstraints()
        
    }
    
}

extension ProfileViewController: UITableViewDataSource , UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 280
        default:
            return 100
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = BookListWithTableViewCell()
            cell.backgroundColor = .clear
            return cell
        case 1:
            let cell = ReadingBookTableViewCell()
            cell.backgroundColor = .clear
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}

extension ProfileViewController {
    func setupViews() {
        view.addSubview(profileTableView)
    }
    func setupConstraints() {
        profileTableView.snp.makeConstraints{
            make in
            make.top.equalToSuperview().inset(-80)
            make.bottom.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview()
//            make.edges.equalToSuperview()
        }
        
    }
}
