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
    
    // MARK: Property
    private var isManualScroll = false
    
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
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "imageCell")
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        collectionView.do {
            $0.showsHorizontalScrollIndicator = false
            $0.isPagingEnabled = true
        }
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
}

// MARK: Interface Function
extension TopCarouselCVCell {
    // MARK: Bind Data
    func bind(images: Observable<[String]>, currentPage: BehaviorRelay<Int>, disposeBag: DisposeBag) {
        
        images.bind(
            to: self.collectionView.rx.items(cellIdentifier: "imageCell", cellType: UICollectionViewCell.self)
        ) { row, item, cell in
            cell.backgroundColor = .clear
            let imageView = UIImageView(image: UIImage(named: item))
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.frame = cell.bounds
            cell.addSubview(imageView)
        }
        .disposed(by: disposeBag)
        
        images
            .map { $0.count }
            .bind(to: self.pageControl.rx.numberOfPages)
            .disposed(by: disposeBag)
        
        currentPage
            .bind(to: self.pageControl.rx.currentPage)
            .disposed(by: disposeBag)
        
        
        self.pageControl.rx.controlEvent(.valueChanged)
            .bind(onNext: {
                let currentPage = self.pageControl.currentPage
                self.isManualScroll = true
                let xOffset = CGFloat(currentPage) * self.collectionView.frame.size.width
                self.collectionView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: true)
            })
            .disposed(by: disposeBag)
        
        self.collectionView.rx.contentOffset
            .map { [weak self] contentOffset -> Int in
                guard let self = self, self.collectionView.frame.width > 0 else { return 0 }
                let page = contentOffset.x / self.collectionView.frame.width
                return page.isFinite ? Int(page) : 0
            }
            .distinctUntilChanged()
            .filter { [weak self] _ in
                guard let self = self else { return false }
                return !self.isManualScroll
            }
            .bind(to: currentPage)
            .disposed(by: disposeBag)
        
        self.collectionView.rx.didEndScrollingAnimation
            .subscribe(onNext: { [weak self] in
                self?.isManualScroll = false
            })
            .disposed(by: disposeBag)
       
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
