//
//  ViewController.swift
//  LibraryApp
//
//  Created by Kamshat Koszhanova on 25.11.2022.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UISearchBarDelegate {

    lazy var libraryTableView: UITableView = {
        let tableView = UITableView()
        tableView.tableHeaderView = HeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 235))
        tableView.backgroundColor = UIColor(red: 210/255, green: 227/255, blue: 255/255, alpha: 1)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.showsHorizontalScrollIndicator = false
        return tableView
    }()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        libraryTableView.delegate = self
        libraryTableView.dataSource = self
        setupViews()
        setupConstraints()
        
        
    }
    
 
}
extension HomeViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 235
        default:
            return 100
        }
     
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = BookShelvesCollectionViewTableViewCell()
            cell.backgroundColor = .clear
            return cell
        case 1:
            let cell = BestBookCollectionViewTableViewCell()
            cell.backgroundColor = .clear
            return cell
        default:
            return UITableViewCell()
        }
    }
}
extension HomeViewController {
    func setupViews() {
        view.addSubview(libraryTableView)
    }
    func setupConstraints() {
        libraryTableView.snp.makeConstraints{
            make in
            make.edges.equalToSuperview()
        }
        
    }
}

