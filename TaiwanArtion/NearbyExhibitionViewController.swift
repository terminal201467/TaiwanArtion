//
//  NearbyExhibitionViewController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/18.
//

import UIKit

class NearbyExhibitionViewController: UIViewController {
    
    private let nearByExhibitionView = NearbyExhibitionView()
    
    private var searchViewController:UISearchController!
    
    private let resultController = ResultTableController()
    
    //MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        view = nearByExhibitionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchViewController()
        setNavigationBar()
    }
    
    //MARK:-SearchViewController
    private func setSearchViewController(){
        searchViewController = UISearchController(searchResultsController: resultController)
        searchViewController.searchBar.barTintColor = .white
        searchViewController.searchBar.searchTextField.borderStyle = .roundedRect
        searchViewController.searchResultsUpdater = resultController
        searchViewController.searchBar.searchTextField.placeholder = "搜尋地點"
        searchViewController.searchBar.showsCancelButton = true
        searchViewController.searchBar.backgroundColor = .white
        searchViewController.searchBar.searchTextField.clearButtonMode = .whileEditing
    }
    
    //MARK:-NavigationBar
    private func setNavigationBar(){
        title = "早找展覽"
        let sideMenuButton = UIBarButtonItem(image: UIImage(named: Icons.sideMenu.text), style: .plain, target: self, action: #selector(presentMenu))
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationItem.leftBarButtonItem = sideMenuButton
        self.navigationItem.searchController = searchViewController
    }
    
    @objc func presentMenu(){
        
        
    }
    
    

    

}
