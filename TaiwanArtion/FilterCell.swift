//
//  FilterTableViewCell.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/25.
//

import UIKit
import SnapKit

protocol TableViewCellDelegate: AnyObject {
    func didButtonPressed()
}

class FilterTableViewCell: UITableViewCell {
    
    static let identifier = "FilterTableViewCell"

    // MARK: Properties
    weak var buttonDelegate: TableViewCellDelegate?
    

    // MARK: - UIs
    
    let filterButton = FilterButton()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "近期展覽"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    var seeAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See all", for: .normal)
        button.setTitleColor(.brown, for: .normal)
        return button
    }()
    
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupUI
    private func setupUI() {
        selectionStyle = .none
        contentView.backgroundColor = .backgroundColor

        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.leading.equalTo(16)
        }
        
        contentView.addSubview(seeAllButton)
        seeAllButton.addTarget(self, action: #selector(push), for: .touchUpInside)
        seeAllButton.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(80)
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.trailing.equalTo(-16)
        }
        
        contentView.addSubview(filterButton)
        filterButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.bottom.equalTo(-16)
        }
    }
    
    // MARK: - Methods
    @objc
    func push() {
        buttonDelegate?.didButtonPressed()
    }
}
