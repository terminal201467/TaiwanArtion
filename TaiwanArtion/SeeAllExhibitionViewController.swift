//
//  BlurController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/26.
//

import UIKit
import SnapKit
import RxSwift

class SeeAllExhibitionViewController: UIViewController {
    
    private let viewModel: SeeAllExhibitionViewModelType
    private let disposeBag = DisposeBag()
    
    // MARK: - UIs
    private let filterButton = FilterButton()
    private let tableView = SeeAllExhibitionTableView()
    
    init(viewModel: SeeAllExhibitionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupUI()
        tableView.cellDelegate = self
        setupBinding()
        viewModel.inputs.viewDidLoad.accept(())
    }
    
    // MARK: - setup Navigation
    private func setupNavigation() {
        navigationItem.title = "近期展覽"
        
        // left Button
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButton))
        leftButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = leftButton
    }
    
    // MARK: - setup UI
    private func setupUI() {
        view.backgroundColor = .backgroundColor
        
        view.addSubview(filterButton)
        filterButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(35)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(filterButton.snp.bottom).offset(16)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setupBinding() {
        viewModel.outputs
            .cellInfoList
            .emit(onNext: { [weak self] info in
                self?.tableView.setCellInfo(list: info)
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Methods
    @objc
    private func backButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension SeeAllExhibitionViewController: SearchResultCellDelegate {
    func pushToExhibitionDetail() {
        let vc = ExhibitionDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
