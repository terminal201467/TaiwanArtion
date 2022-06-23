//
//  MapView.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/4/23.
//

import UIKit
import RxSwift
import MapKit

enum ButtonsName{
    case findExhibition,findLocation
    var text:String{
        switch self {
        case .findExhibition: return "尋找展覽"
        case .findLocation:   return "尋找地點"
        }
    }
}

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
        button.setTitle(ButtonsName.findExhibition.text, for: .normal)
        return button
    }()
    
    let findLocationButton:UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(ButtonsName.findLocation.text, for: .normal)
        return button
    }()
    
    lazy var findButtons:UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [findExhibitionButton,findLocationButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    let map:MKMapView = {
       let mapView = MKMapView()
        return mapView
    }()
    
    let listView:UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
//        addSubview(findExhibitionButton)
//        addSubview(findLocationButton)
        addSubview(findButtons)
        addSubview(map)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout(){
        findLocationButton.snp.makeConstraints { make in
            make.width.equalTo(92)
            make.height.equalTo(36)
        }
        
        findExhibitionButton.snp.makeConstraints { make in
            make.width.equalTo(92)
            make.height.equalTo(36)
        }
        
        map.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
