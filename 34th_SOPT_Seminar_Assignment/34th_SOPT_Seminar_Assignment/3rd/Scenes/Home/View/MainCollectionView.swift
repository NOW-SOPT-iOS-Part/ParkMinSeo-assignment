//
//  mainCollectionView.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/29/24.
//

import UIKit

final class MainCollectionView: UICollectionView {
    
    // MARK: view init
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: UICollectionViewLayout.init())
        self.collectionViewLayout = self.createLayout()
        registerCells()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: private func
    private func registerCells() {
        self.register(
            HeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HeaderView.className
        )
        self.register(TopCarouselCVCell.self, forCellWithReuseIdentifier: TopCarouselCVCell.className)
        self.register(NormalContentCVCell.self, forCellWithReuseIdentifier: NormalContentCVCell.className)
        self.register(StreamContentCVCell.self, forCellWithReuseIdentifier: StreamContentCVCell.className)
        self.register(AdContentCVCell.self, forCellWithReuseIdentifier: AdContentCVCell.className)
    }
}

// MARK: UICollecitonView Compositional Layout
extension MainCollectionView {
    
    // MARK: Section Layout을 포함한 Compositional Layout return
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.scrollDirection = .vertical
        config.interSectionSpacing = 10
        
        return UICollectionViewCompositionalLayout(sectionProvider: { [weak self] sectionIndex, _ in
            switch MainCVSection.allCases[sectionIndex] {
            
            case .topCarousel:
                return (self?.createTopContentSection())!
            case .recommend:
                return (self?.createNormalContentSection())!
            case .stream:
                return (self?.createStreamContentSection())!
            case .event:
                return (self?.createNormalContentSection())!
            case .ads:
                return (self?.createAdContentSection())!
            case .fantastic:
                return (self?.createNormalContentSection())!
            }
        }, configuration: config)
    }
    
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
//        section.contentInsets = .init(top: 15, leading: 0, bottom: 15, trailing: 0)
//        section.orthogonalScrollingBehavior = .continuous
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
