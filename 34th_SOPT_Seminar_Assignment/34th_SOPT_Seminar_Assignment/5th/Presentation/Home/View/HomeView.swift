//
//  HomeView.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 6/6/24.
//

import UIKit
import SnapKit
import Then

final class HomeView: UIView {
    
    // MARK: Properties
    
    // MARK: Views
    lazy var mainContentView = UICollectionView(frame: .zero, collectionViewLayout: self.createLayout())
    
    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpStyle()
        setUpLayout()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: setUpView
    private func setUpView() {
        self.mainContentView.register(
            CVHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: CVHeaderView.className
        )
        self.mainContentView.register(TopCarouselCVCell.self, forCellWithReuseIdentifier: TopCarouselCVCell.className)
        self.mainContentView.register(NormalContentCVCell.self, forCellWithReuseIdentifier: NormalContentCVCell.className)
        self.mainContentView.register(StreamContentCVCell.self, forCellWithReuseIdentifier: StreamContentCVCell.className)
        self.mainContentView.register(AdContentCVCell.self, forCellWithReuseIdentifier: AdContentCVCell.className)
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        self.backgroundColor = .black
        mainContentView.backgroundColor = .clear
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [
            mainContentView
        ].forEach { self.addSubview($0) }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        mainContentView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}

// MARK: UICollecitonView Compositional Layout
extension HomeView {
    
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
