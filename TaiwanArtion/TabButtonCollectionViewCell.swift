//
//  TabButtonCollectionViewCell.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/5/19.
//

import UIKit
import SnapKit

class TabButtonCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MainTabCollectionViewCell"
    
    //MARK: - UIs
    let pageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .gray
        return label
    }()
    
    let currentView: UIView = {
        let view = UIView()
        return view
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(pageLabel)
        pageLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(currentView)
        currentView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(pageLabel)
            make.bottom.equalTo(pageLabel.snp.bottom)
            make.height.equalTo(3)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.3) {
                    self.currentView.backgroundColor = self.isSelected ? UIColor.brown : UIColor.clear
                    self.layoutIfNeeded()
                }
            }
        }
    }
}
