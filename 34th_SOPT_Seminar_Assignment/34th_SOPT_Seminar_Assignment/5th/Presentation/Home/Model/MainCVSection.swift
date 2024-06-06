//
//  MainCVSection.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 6/6/24.
//

import Foundation
import UIKit
import Differentiator

enum MainCVSection: Hashable, CaseIterable {
    /// 최상단 캐러셀 섹션
    case topCarousel
    /// 티빙 추천 콘텐츠 섹션
    case recommend
    /// 라이브 섹션
    case stream
    /// 1화 무료 이벤트 섹션
    case event
    /// 광고 섹션
    case ads
    /// 신비로운 영화 섹션
    case fantastic
}

enum MainCVItem {
    case topCarousel([String])
    case recommend([NormalContent])
    case stream([StreamContent])
    case event([NormalContent])
    case ads([AdContent])
    case fantastic([NormalContent])
}

extension MainCVSection {
    func getHeaderContent() -> HeaderContent {
        switch self {
            
        case .topCarousel:
            return .init(labelTitle: "", showButton: false)
        case .recommend:
            return .init(labelTitle: "티빙에서 꼭 봐야하는 콘텐츠", showButton: true)
        case .stream:
            return .init(labelTitle: "인기 LIVE 채널", showButton: true)
        case .event:
            return .init(labelTitle: "1화 무료! 파라마운트 + 인기 시리즈", showButton: true)
        case .ads:
            return .init(labelTitle: "", showButton: false)
        case .fantastic:
            return .init(labelTitle: "마술보다 더 신비로운 영화(신비로운 영화사전님)", showButton: true)
        }
    }
    
    func createLayoutSection() -> NSCollectionLayoutSection {
        switch self {
            
        case .topCarousel:
            return self.createTopContentSection()
        case .recommend, .event, .fantastic:
            return self.createNormalContentSection()
        case .stream:
            return self.createStreamContentSection()
        case .ads:
            return self.createAdContentSection()
        }
    }
}


extension MainCVSection {
    // MARK: TopCarouselCVCell을 사용하는 Section Layout - 최상단 콘텐츠 섹션
    private func createTopContentSection() -> NSCollectionLayoutSection {
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(500))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        return section
    }


    // MARK: NormalContentCVCell을 사용하는 Section Layout - 티빙 추천 콘텐츠 섹션, 1화 무료 이벤트 섹션, 신비로운 영화 섹션
    private func createNormalContentSection() -> NSCollectionLayoutSection {
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .estimated(180))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // header
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(30))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.contentInsets = .init(top: 15, leading: 15, bottom: 15, trailing: 15)
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .continuous
        return section
    }

    // MARK: StreamContentCVCell을 사용하는 Section Layout - 라이브 콘텐츠 섹션
    private func createStreamContentSection() -> NSCollectionLayoutSection {
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(160), heightDimension: .estimated(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // header
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(30))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.contentInsets = .init(top: 15, leading: 15, bottom: 15, trailing: 15)
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .continuous
        return section
    }

    // MARK: AdContentCVCell을 사용하는 Section Layout - 광고 콘텐츠 섹션
    private func createAdContentSection() -> NSCollectionLayoutSection {
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(60))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 15, leading: 0, bottom: 15, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
}
