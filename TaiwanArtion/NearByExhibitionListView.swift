//
//  NearByListView.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/13.
//

import UIKit

enum TitleType: Int, CaseIterable {
    case anyType = 0, cultureCreationArea, artGallery, museum, exhibitionHall
    var typeText: String {
        switch self {
        case .anyType: return "不限"
        case .cultureCreationArea: return "文創園區"
        case .artGallery: return "美術館"
        case .museum: return "博物館"
        case .exhibitionHall: return "展覽館"
        }
    }
}

class NearByExhibtionListView: UIView {
    
    var slideUp: (() -> Void)?
    
    var slideDown: (() -> Void)?
    
    var moveMentY: CGFloat = 550
    
    let blackLine: UIView = {
       let view = UIView()
        view.backgroundColor = .textGrayB0B0B0
        return view
    }()
    
    let showListTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "顯示列表"
        return label
    }()
    
    let brownDeshLine: UIView = {
        let view = UIView()
        view.backgroundColor = .brownColor
        view.layer.cornerRadius = 2
        view.isHidden = true
        return view
    }()

    let exhibitionList: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(ExhibitionListTableViewTableViewCell.self, forCellReuseIdentifier: ExhibitionListTableViewTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = 120
        tableView.estimatedRowHeight = 200
        tableView.isHidden = true
        tableView.allowsSelection = false
        return tableView
    }()
    
    let collectionItems: UICollectionView = {
       let flowLayout = UICollectionViewFlowLayout()
        flowLayout.estimatedItemSize = CGSize(width: 100, height: 60)
        flowLayout.itemSize = CGSize(width: 80, height: 60)
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 30
        flowLayout.minimumLineSpacing = 20
        let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: flowLayout)
        collectionView.register(ItemsCollectionCell.self, forCellWithReuseIdentifier: ItemsCollectionCell.identifier)
        collectionView.isScrollEnabled = false
        collectionView.allowsSelection = true
        collectionView.delegate = nil
        collectionView.dataSource = nil
        collectionView.isHidden = true
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewInBottomAutoLayout()
        setPanGesture()
        setItemsAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewInBottomAutoLayout() {
        addSubview(blackLine)
        addSubview(showListTitle)
        blackLine.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.width.equalTo(40)
            make.top.equalToSuperview().offset(4)
            make.centerX.equalToSuperview()
        }
        
        showListTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(34)
        }
    }
    
    func setPanGesture() {
        let panUpGesture: UIPanGestureRecognizer = {
            let pan = UIPanGestureRecognizer(target: self, action: #selector(panUpAction(_:)))
            pan.maximumNumberOfTouches = 1
            pan.minimumNumberOfTouches = 1
            pan.isEnabled = true
            return pan
        }()
        addGestureRecognizer(panUpGesture)
    }
    
    func setItemsAutoLayout() {
        addSubview(collectionItems)
        addSubview(exhibitionList)
        addSubview(brownDeshLine)
        collectionItems.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        exhibitionList.snp.makeConstraints { make in
            make.top.equalTo(collectionItems.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        brownDeshLine.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(3)
            make.bottom.equalTo(collectionItems.snp.bottom).offset(-5)
        }
    }
    
    @objc func panUpAction(_ recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            self.moveMentY = self.frame.origin.y
        case .changed:
            print("change")
        case .ended:
            let transitionY = recognizer.translation(in: self).y
            self.frame.origin.y = moveMentY + transitionY
            if  transitionY > 10 {
                slideDown?()
            } else if transitionY < 40 {
                slideUp?()
            }
        default:
            print("default")
        }
    }
}