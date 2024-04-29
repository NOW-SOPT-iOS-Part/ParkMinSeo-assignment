//
//  homeViewController.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/29/24.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: View
    private let rootView = HomeView()
        
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
extension HomeViewController: UICollectionViewDelegate {
    // MARK: 별도의 DiffableDataSource 없이 Header 등록 시 필요합니다
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.className, for: indexPath) as? HeaderView else { return UICollectionReusableView() }
        
        let headerData: HeaderContent = {
            switch MainCVSection.allCases[indexPath.section] {
                
            case .recommend:
                return .init(labelTitle: "티빙에서 꼭 봐야하는 콘텐츠", buttonWithAction: UIAction(title:"전체보기") {_ in })
            case .stream:
                return .init(labelTitle: "인기 LIVE 채널", buttonWithAction: UIAction(title:"전체보기") {_ in })
            case .event:
                return .init(labelTitle: "1화 무료! 파라마운트 + 인기 시리즈", buttonWithAction: UIAction(title:"전체보기") {_ in })
            case .ads:
                return .init(labelTitle: "", buttonWithAction: .init(handler: {_ in }))
            case .fantastic:
                return .init(labelTitle: "마술보다 더 신비로운 영화(신비로운 영화사전님)", buttonWithAction: UIAction(title:"전체보기") {_ in })
            }
        }()
        
        header.fetchData(headerData)
        return header
    }
}

// MARK: UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch MainCVSection.allCases[section] {
            
        case .recommend, .event, .fantastic, .stream:
            return 4
        case .ads:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch MainCVSection.allCases[indexPath.section] {
            
        case .recommend, .event, .fantastic:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NormalContentCVCell.className, for: indexPath) as? NormalContentCVCell else { return UICollectionViewCell() }
            cell.fetchData(.init())
            return cell
        case .stream:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StreamContentCVCell.className, for: indexPath) as? StreamContentCVCell else { return UICollectionViewCell() }
            cell.fetchData(.init(contentID: -1, image: "contentImage2", rank: 0, broadcastingCompany: "Asdf", title: "Asdf", viewerShip: 00.00))
            return cell
        case .ads:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdContentCVCell.className, for: indexPath) as? AdContentCVCell else { return UICollectionViewCell() }
            cell.fetchData(.init(contentId: -1, image: "longTabImage1"))
            return cell
        }
    }
    
    
}
