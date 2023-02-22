//
//  BestBookCollectionViewCell.swift
//  LibraryApp
//
//  Created by Kamshat Koszhanova on 09.12.2022.
//

import UIKit

class BestBookCollectionViewCell: UICollectionViewCell {
    lazy  var pageSlider: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bestbook")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(pageSlider)
    }
    func setupConstraints() {
        
        pageSlider.snp.makeConstraints {
            make in
            make.top.equalToSuperview().inset(30)
            make.leading.equalToSuperview().inset(60)
            make.trailing.equalToSuperview().inset(50)
//            make.bottom.equalToSuperview().inset(20)
            make.height.equalTo(170)
            make.width.equalTo(190)
            
        }
    }
}
