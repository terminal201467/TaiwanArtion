//
//  PhotoCollectionViewCell.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/8/6.
//

import UIKit
import SnapKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PhotoCollectionViewCell"
    
    //MARK: - UIs
    private let photoColumnImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "2"))
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        contentView.addSubview(photoColumnImageView)
        photoColumnImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(53)
            make.height.equalTo(52)
        }
    }
}
