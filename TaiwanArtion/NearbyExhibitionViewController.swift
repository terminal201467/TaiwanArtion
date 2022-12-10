//
//  NearbyExhibitionViewController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/18.
//

import UIKit
import SideMenu
import RxSwift
import MapKit

class NearbyExhibitionViewController: UIViewController {
    
    let nearByExhibitionView = NearByExhibitionView()
    
    private var searchMode: Bool = false
    
    //MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        view = nearByExhibitionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        setMapView()
        setNavigationMode()
    }
    
    private func setNavigationMode() {
        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"),
                                               style: .plain,
                                               target: self,
                                               action: #selector(searchButtonPress))

        let menuButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(menuButtonPress))
        
        searchButton.tintColor = .black
        menuButton.tintColor = .black
        self.navigationController?.navigationBar.tintColor = .backgroundColor
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.rightBarButtonItem = searchButton
        navigationItem.leftBarButtonItem = menuButton
        navigationItem.titleView = nearByExhibitionView.containerView
        nearByExhibitionView.searchContainerView.isHidden = true
    }
    
    private func setSearchMode() {
        let arrowButton = UIBarButtonItem(image: UIImage(systemName: "chevron.down"), style: .plain, target: self, action: #selector(searchButtonPress))
        arrowButton.tintColor = .black
        navigationItem.rightBarButtonItem = arrowButton
        navigationItem.leftBarButtonItem = nil
        navigationItem.titleView = nearByExhibitionView.containerView
        nearByExhibitionView.searchContainerView.isHidden = false
    }
    
    private func setMapView() {
        let location = CLLocationCoordinate2D(latitude: 22.999696, longitude: 120.212768)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        nearByExhibitionView.mapView.setRegion(region, animated: true)
    }

    @objc private func searchButtonPress() {
        searchMode.toggle()
        searchMode ? setSearchMode() : setNavigationMode()
        nearByExhibitionView.searchMode.toggle()
    }
    
    @objc private func menuButtonPress() {
        
    }
}
