//
//  TopCarouselCVCell.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 6/6/24.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxRelay

final class TopCarouselCVCell: UICollectionViewCell {
    
    // MARK: Properties -> 해당 내용 VM으로 이식
    private let images = BehaviorSubject<[String]>(
        value: [
            "contentImage1",
            "contentImage2",
            "contentImage3",
            "contentImage4",
            "contentImage1",
            "contentImage2",
            "contentImage3",
            "contentImage4"
        ]
    )
    private let currentPage = BehaviorRelay(value: 0)
    
    // MARK: Views
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: TopCarouselCVCell.createLayout())
    private let pageControl = UIPageControl()
    
    // MARK: Life Cycle - viewDidLoad
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
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "justImageCell")
        self.pageControl.addAction(pageChangeAction, for: .touchUpInside)
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        collectionView.do {
            $0.showsHorizontalScrollIndicator = false
            $0.isPagingEnabled = true
        }
        
//        pageControl.do {
//            $0.numberOfPages = images.count
//            $0.currentPage = currentPage
//        }
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [
            collectionView,
            pageControl
        ].forEach { self.contentView.addSubview($0) }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(460)
        }
        
        pageControl.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(collectionView.snp.bottom)
            $0.height.equalTo(40)
        }
    }
    
    // MARK: private func - pageControl Action
    private lazy var pageChangeAction = UIAction { [weak self] action in
        guard let sender = action.sender as? UIPageControl, let self = self else { return }
        let currentPage = sender.currentPage
        let xOffset = CGFloat(currentPage) * collectionView.frame.size.width
        collectionView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: true)
    }

}

// MARK: Layout Configuration
extension TopCarouselCVCell {
    private static func createLayout() -> UICollectionViewFlowLayout {
        return UICollectionViewFlowLayout().then {
            $0.minimumLineSpacing = 0
            $0.minimumInteritemSpacing = 0
            $0.estimatedItemSize = .init(width: 393 , height: 460)
            $0.scrollDirection = .horizontal
        }
    }
}
