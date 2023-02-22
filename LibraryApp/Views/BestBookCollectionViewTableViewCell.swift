//
//  BestBookCollectionViewTableViewCell.swift
//  LibraryApp
//
//  Created by Kamshat Koszhanova on 26.11.2022.
//

import UIKit

class BestBookCollectionViewTableViewCell: UITableViewCell {
    
    var images = ["bestbook", "bestbook2", "bestbook4", "bestbook5", "bestbook6", "bestbook7", "bestbook8"]
    var timer: Timer?
    var cntIndex = 0
    
    
    lazy private var secondSectionTitle: UILabel = {
        let label = UILabel()
        label.text = "Best Ever Book Lists"
        label.font = UIFont(name: "HoeflerText-Black", size: 25)
        label.textColor = UIColor(red: 41/255, green: 80/255, blue: 148/255, alpha: 1)
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: contentView.bounds.width, height: 250)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(BestBookCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .clear
        collectionView.layer.cornerRadius = 20
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    
    private lazy var pageController: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = images.count
        return pageControl
    }()
    
//    lazy private var secondSectionImage1: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(named: "bestbook")
//        return image
//    }()
//    lazy private var secondSectionImage2: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(named: "bestbook2")
//        return image
//    }()
//    lazy private var secondSectionImage3: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(named: "bestbook3")
//        return image
//    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        secondSectionImage1.backgroundColor = .red
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(red: 90/255, green: 164/255, blue: 238/255, alpha: 1)
        setupViews()
        setupConstraints()
        startTimer()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func moveToNextIndex() {
        if cntIndex < images.count - 1 {
            cntIndex += 1
        }else {
            cntIndex = 0
        }
        collectionView.scrollToItem(at: IndexPath(item: cntIndex, section: 0), at: .centeredHorizontally, animated: true)
        
        pageController.currentPage = cntIndex
    }
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    
}
extension BestBookCollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func setupViews() {
        contentView.addSubview(secondSectionTitle)
        contentView.addSubview(collectionView)
        contentView.addSubview(pageController)
//        contentView.addSubview(secondSectionImage1)
//        contentView.addSubview(secondSectionImage2)
//        contentView.addSubview(secondSectionImage3)
    }
    func setupConstraints() {
        secondSectionTitle.snp.makeConstraints {
            make in
//            make.bottom.equalTo(secondSectionImage1.snp.top).inset(5)
            make.leading.equalToSuperview().inset(25)
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(5)
        }
        collectionView.snp.makeConstraints {
            make in
            make.top.equalToSuperview().inset(40)
//            make.bottom.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(25)
            make.trailing.equalToSuperview().inset(25)
            make.height.equalTo(200)
            
        }
        pageController.snp.makeConstraints {
            make in
            make.top.equalToSuperview().inset(130)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(180)
//            make.width.equalTo(180)

        }
        
        
//        secondSectionImage1.snp.makeConstraints {
//            make in
//            make.top.equalToSuperview().inset(60)
//            make.leading.trailing.equalToSuperview().inset(25)
//            make.height.equalTo(180)
//            make.width.equalTo(150)
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BestBookCollectionViewCell
    
            cell.pageSlider.image = UIImage(named: images[indexPath.row])
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
