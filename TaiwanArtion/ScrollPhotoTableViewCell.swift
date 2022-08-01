//
//  ScrollPhotoTableViewCell.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/25.
//

import UIKit
import SnapKit

class ScrollPhotoTableViewCell: UITableViewCell {
    
    static let identifier = "ScrollPhotoTableViewCell"
    
    private var data = [ScrollPhoto]()
    
    // MARK: - UIs
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "沒有想法嗎"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 28)
        return label
    }()
    
    let titleImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Bulb"))
        return image
    }()
    
    let subtitlelabel: UILabel = {
        let label = UILabel()
        label.text = "看看最近有什麼最新展覽吧！"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .systemGray
        return label
    }()
    
    let imageBackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "CardBackgroundGray")
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var photoScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .black
        // 是否顯示水平的滑動條
        scrollView.showsHorizontalScrollIndicator = false
        // 是否顯示垂直的滑動條
        scrollView.showsVerticalScrollIndicator = false
        // 是否可以按狀態列回到最上方
        scrollView.scrollsToTop = false
        // 滑動超過範圍時是否使用彈回效果
        scrollView.bounces = true
        // 以一頁為單位滑動
        scrollView.isPagingEnabled = true
        scrollView.layer.cornerRadius = 20
        scrollView.delegate = self
        return scrollView
    }()
    
    lazy
    var scrollViewContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 0
        return stackView
    }()
    
    let imagePageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .brownColor
        pageControl.preferredIndicatorImage = UIImage(named: "BrownPageControl")
        return pageControl
    }()
    
    lazy
    var exhibitionNameAndDate: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [exhibitionNameLabel, exhibitionDateLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 3
        return stackView
    }()
    
    let exhibitionNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let exhibitionDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .boldSystemFont(ofSize: 15)
        return label
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
//        sizeToFit()
        
        contentView.backgroundColor = .backgroundColor
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(24)
            make.leading.equalTo(16)
//            make.trailing.equalTo(-15)
        }
        
        contentView.addSubview(titleImageView)
        titleImageView.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).offset(11)
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.height.equalTo(22)
            make.width.equalTo(23)
        }

        contentView.addSubview(subtitlelabel)
        subtitlelabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(16)
        }

        contentView.addSubview(imageBackView)
        imageBackView.snp.makeConstraints { make in
            make.top.equalTo(subtitlelabel.snp.bottom).offset(16)
            make.bottom.equalTo(-30)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
        }
        
        let width = UIScreen.main.bounds.width - 65
        let height = width / 325 * 285
        
        imageBackView.addSubview(photoScrollView)
        photoScrollView.snp.makeConstraints { make in
            make.height.equalTo(height)
            make.top.equalTo(imageBackView.snp.top).offset(16)
            make.leading.equalTo(imageBackView.snp.leading).offset(16)
            make.trailing.equalTo(imageBackView.snp.trailing).offset(-16)
            make.bottom.equalTo(imageBackView.snp.bottom).offset(-81)
        }

        photoScrollView.addSubview(scrollViewContainer)
        scrollViewContainer.snp.makeConstraints { make in
            make.top.equalTo(photoScrollView.snp.top)
            make.leading.equalTo(photoScrollView.snp.leading)
            make.trailing.equalTo(photoScrollView.snp.trailing)
            make.height.equalTo(photoScrollView.snp.height)
        }

        imageBackView.addSubview(exhibitionNameAndDate)
        exhibitionNameAndDate.snp.makeConstraints { make in
            make.top.equalTo(photoScrollView.snp.bottom).offset(19)
            make.leading.equalTo(16)
        }

        contentView.addSubview(imagePageControl)
        imagePageControl.snp.makeConstraints { make in
            make.top.equalTo(imageBackView.snp.bottom).offset(5)
            make.centerX.equalTo(self.snp.centerX)
        }
    }
    
    func bind(data: [ScrollPhoto]) {
        self.data = data
        imagePageControl.numberOfPages = data.count
        data.map { $0.url }.forEach { [weak self] url in
            self?.createPhoto(url: url)
        }
        let scrollPhoto = data[0]
        exhibitionNameLabel.text = scrollPhoto.title
        exhibitionDateLabel.text = "\(scrollPhoto.startDate) ~ \(scrollPhoto.endDate)"
    }
    
    private func createPhoto(url: String) {
        let imageView = UIImageView(image: UIImage(named: url))
        imageView.contentMode = .scaleAspectFit
        scrollViewContainer.addArrangedSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(photoScrollView.snp.top)
            make.bottom.equalTo(photoScrollView.snp.bottom)
            make.width.equalTo(photoScrollView.snp.width)
        }
    }
}

// MARK: - Scroll Delegate
extension ScrollPhotoTableViewCell: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = scrollView.currentPage
        let scrollPhoto = data[index]
        imagePageControl.currentPage = index
        exhibitionNameLabel.text = scrollPhoto.title
        exhibitionDateLabel.text = "\(scrollPhoto.startDate) ~ \(scrollPhoto.endDate)"
    }
}

extension UIScrollView {
    var currentPage: Int {
        Int((self.contentOffset.x + (0.5*self.frame.size.width)) / self.frame.width)
    }
}
