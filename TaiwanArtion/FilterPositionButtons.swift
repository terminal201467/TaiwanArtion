//
//  FilterAreaCollectionView.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/7/15.
//

import UIKit

final public class FilterPositionButtons: UICollectionView {

    let filterPosition: [String] = ["不限", "文創園區", "博物館", "美術館", "藝文中心"]

    convenience init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .backgroundColor
        register(FilterPositionCell.self, forCellWithReuseIdentifier: FilterPositionCell.identifier)
        isScrollEnabled = false
        dataSource = self
        delegate = self
        self.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Data Source
extension FilterPositionButtons: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterPosition.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterPositionCell.identifier, for: indexPath) as! FilterPositionCell
        cell.areaLabel.text = filterPosition[indexPath.row]
        return cell
    }
}

//MARK: - Delegate
extension FilterPositionButtons: UICollectionViewDelegate {

}

//MARK: - FlowLayout
extension FilterPositionButtons: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // (collectionView.邊界.寬 - 間距大小 * cell有幾幾個間距) / 想要幾個cell
        let width = (collectionView.bounds.width - 2 * 3) / 4
//        let height = width
//        let width = self.frame.width / 4
        let height = self.frame.height - 60

        return CGSize(width: width, height: height)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}
