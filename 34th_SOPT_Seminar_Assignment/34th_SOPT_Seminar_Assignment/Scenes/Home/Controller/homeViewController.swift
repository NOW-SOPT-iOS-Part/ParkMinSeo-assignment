//
//  homeViewController.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/29/24.
//

import UIKit

final class homeViewController: UIViewController {
    
    // MARK: View
    private let rootView = homeView()
        
    // MARK: Life Cycle - loadView
    override func loadView() {
        self.view = rootView
    }
    
    // MARK: Life Cycle - viewDidLoad
    override func viewDidLoad() {
        rootView.mainContentView.delegate = self
        rootView.mainContentView.dataSource = self
    }
}

// MARK: UICollectionViewDelegate
extension homeViewController: UICollectionViewDelegate {
    // MARK: 별도의 DiffableDataSource 없이 Header 등록 시 필요합니다
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.className, for: indexPath) as? HeaderView else { return UICollectionReusableView() }
        return header
    }
}

// MARK: UICollectionViewDataSource
extension homeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch mainCVSection.allCases[section] {
            
        case .recommend, .event, .fantastic, .stream:
            return 4
        case .ads:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch mainCVSection.allCases[indexPath.section] {
            
        case .recommend, .event, .fantastic:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: normalContentCVCell.className, for: indexPath) as? normalContentCVCell else { return UICollectionViewCell() }
            cell.fetchData(.init())
            return cell
        case .stream:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: streamContentCVCell.className, for: indexPath) as? streamContentCVCell else { return UICollectionViewCell() }
            cell.fetchData(.init(contentID: -1, image: "contentImage2", rank: 0, broadcastingCompany: "Asdf", title: "Asdf", viewerShip: 00.00))
            return cell
        case .ads:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: adContentCVCell.className, for: indexPath) as? adContentCVCell else { return UICollectionViewCell() }
            cell.fetchData(.init(contentId: -1, image: "longTabImage1"))
            return cell
        }
    }
    
    
}
