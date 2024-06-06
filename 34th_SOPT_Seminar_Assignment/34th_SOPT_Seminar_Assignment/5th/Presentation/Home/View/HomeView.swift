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
        
        return UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            let sectionType = MainCVSection.allCases[sectionIndex]
            return sectionType.createLayoutSection()
        }, configuration: config)
    }
}
