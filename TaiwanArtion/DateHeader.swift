//
//  DateHeader.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/26.
//

import UIKit
import SnapKit
import JTAppleCalendar

class DateHeader: JTAppleCollectionReusableView {
    
    static let identifier = "DateHeader"
    
    // MARK: - UIs
    var headerLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private
    lazy var weekStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [mondayLabel, tuesdayLabel, wednesLabel, thursdayLabel, fridayLabel, saturdayLabel, sundayLabel])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        return stackView
    }()
    
    private let mondayLabel: UILabel = {
        let label = UILabel()
        label.text = "一"
        return label
    }()
    
    private let tuesdayLabel: UILabel = {
        let label = UILabel()
        label.text = "二"
        return label
    }()
    
    private let wednesLabel: UILabel = {
        let label = UILabel()
        label.text = "三"
        return label
    }()
    
    private let thursdayLabel: UILabel = {
        let label = UILabel()
        label.text = "四"
        return label
    }()
    
    private let fridayLabel: UILabel = {
        let label = UILabel()
        label.text = "五"
        return label
    }()
    
    private let saturdayLabel: UILabel = {
        let label = UILabel()
        label.text = "六"
        return label
    }()
    
    private let sundayLabel: UILabel = {
        let label = UILabel()
        label.text = "日"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        addSubview(weekStackView)
        weekStackView.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(25)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(30)
        }
    }
}
