//
//  homeView.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/29/24.
//

import UIKit
import SnapKit
import Then

final class HomeView: UIView {
    
    // MARK: Properties
    
    // MARK: Views
    // MARK: This is for test
    private let aboveView = UIView()
    private let topBarView = UIView()
    let upperTabBar = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 100, height: 150)
        $0.minimumLineSpacing = 8
        $0.minimumInteritemSpacing = 10
        $0.scrollDirection = .horizontal
    })
    
    let mainCarouselView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 100, height: 150)
        $0.minimumLineSpacing = 8
        $0.minimumInteritemSpacing = 10
        $0.scrollDirection = .horizontal
    })
    
    let mainContentView = MainCollectionView()
    
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
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        // MARK: this is for test
        self.backgroundColor = .black
        topBarView.backgroundColor = .gray
        upperTabBar.backgroundColor = .blue
        mainCarouselView.backgroundColor = .clear
        mainContentView.backgroundColor = .clear
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [
            topBarView,
            //            upperTabBar
        ].forEach { self.aboveView.addSubview($0) }
        
        
        [
            //            aboveView,
            //            mainCarouselView,
            mainContentView
        ].forEach { self.addSubview($0) }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        mainContentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
