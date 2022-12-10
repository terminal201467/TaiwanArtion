//
//  NearByExhibitionView.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/8.
//

import UIKit
import MapKit

class NearByExhibitionView: UIView {
    
    var searchMode: Bool = false {
        didSet {
            searchMode ? setSearchModeLayout() : setNavigationModeLayout()
        }
    }
    
    //FindButtons
    let findExhibitionButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .brownColor
        button.tintColor = .tintColor
        button.setTitle("尋找展覽", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.layer.cornerRadius = 5
        return button
    }()
    
    let findLocationButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .brownColor
        button.tintColor = .tintColor
        button.setTitle("尋找地點", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.layer.cornerRadius = 5
        return button
    }()
    
    let findExhibitionLabel: UILabel = {
        let label = UILabel()
        label.text = "尋找展覽"
        label.textColor = .brownColor
        label.font = .boldSystemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let containerView: UIView = {
       let view = UIView()
        return view
    }()
    
    lazy var findButtons: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [findExhibitionButton,findLocationButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.spacing = 8
        return stackView
    }()
    
    let searchContainerView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let searchBar : UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.searchBarStyle = .default
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.placeholder = "Search"
        return searchBar
    }()
    
    let cityFilterButton: UIButton = {
       let button = UIButton()
        button.setTitle("縣市", for: .normal)
        button.backgroundColor = .brownColor
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 5
        return button
    }()
    
    let dateFilterButton: UIButton = {
       let button = UIButton()
        button.setTitle("日期", for: .normal)
        button.backgroundColor = .brownColor
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 5
        return button
    }()
    
    lazy var filterButtons: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [cityFilterButton, dateFilterButton])
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.axis = .horizontal
        return stackView
    }()
    
    let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.mapType = .standard
        return mapView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setMapViewLayout()
        setNavigationModeLayout()
        setSearchContainerView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setNavigationModeLayout() {
        findExhibitionLabel.removeFromSuperview()
        containerView.addSubview(findButtons)
        findButtons.snp.makeConstraints { make in
            make.leading.equalTo(containerView.snp.leading)
            make.top.equalTo(containerView.snp.top)
            make.bottom.equalTo(containerView.snp.bottom)
            make.trailing.equalTo(containerView.snp.centerX)
        }
    }
    
    func setSearchModeLayout() {
        findButtons.removeFromSuperview()
        containerView.addSubview(findExhibitionLabel)
        findExhibitionLabel.snp.makeConstraints { make in
            make.leading.equalTo(containerView.snp.leading).offset(20)
            make.top.equalTo(containerView.snp.top)
            make.bottom.equalTo(containerView.snp.bottom)
            make.trailing.equalTo(containerView.snp.centerX).offset(-70)
        }
    }
    
    private func setSearchContainerView() {
        addSubview(searchContainerView)
        searchContainerView.addSubview(searchBar)
        searchContainerView.addSubview(filterButtons)
        searchContainerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.height.equalTo(100)
        }
        
        searchBar.snp.makeConstraints { make in
            make.leading.equalTo(searchContainerView.snp.leading).offset(20)
            make.trailing.equalTo(searchContainerView.snp.trailing).offset(-20)
            make.top.equalTo(searchContainerView.snp.top)
            make.height.equalTo(40)
        }
        
        filterButtons.snp.makeConstraints { make in
            make.leading.equalTo(searchBar.snp.leading)
            make.trailing.equalTo(searchContainerView.snp.centerX).offset(-20)
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.bottom.equalTo(searchContainerView.snp.bottom).offset(-20)
        }
    }
    
    private func setMapViewLayout() {
        addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}