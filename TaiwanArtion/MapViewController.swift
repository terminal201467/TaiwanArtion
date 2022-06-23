//
//  MapViewController.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/4/23.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    //MARK: -UIProperties
    private let mapView = MapView()
    
    //MARK: -LifeCycle
    override func loadView() {
        super.loadView()
        view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        
    }
    
    private func setNavigationBar(){
        navigationController?.navigationBar.tintColor = .white
        navigationItem.titleView = mapView.findButtons
        navigationItem.rightBarButtonItem = mapView.searchBarButton
        navigationItem.leftBarButtonItem = mapView.menuBarButton
    }
    
    //MARK:-setTableView
    private func setMap(){
        
        
    }
    
    
    
    //MARK:-setPageViewController
    func setPageViewController(){
        
    }

}
