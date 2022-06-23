//
//  MapView.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/4/23.
//

import UIKit

class MapView: UIView {

    let menuBarButton:UIBarButtonItem = {
        let barButton = UIBarButtonItem(systemItem: .compose, primaryAction: nil, menu: nil)
        return barButton
    }()
    
    let searchBarButton:UIBarButtonItem = {
        let barButton = UIBarButtonItem(systemItem: .search, primaryAction: nil, menu: nil)
        return barButton
    }()
    
    let findExhibitionButton:UIButton = {
       let button = UIButton()
        return button
    }()
    
    let findLocationButton:UIButton = {
       let button = UIButton()
        return button
    }()
    
    let map:MapView = {
       let mapView = MapView()
        return mapView
    }()
    
    let listView:UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(map)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        map.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
