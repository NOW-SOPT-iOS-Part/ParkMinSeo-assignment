//
//  CarouselViewController.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/30/24.
//

import UIKit

final class CarouselViewController: UIViewController {
    // MARK: Properties
    private let images = ["contentImage1","contentImage2","contentImage3","contentImage4"]
    private var currentPage = 0
    
    // MARK: Views
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout:  UICollectionViewFlowLayout().then {
        $0.minimumLineSpacing = 0
        $0.minimumInteritemSpacing = 0
        $0.estimatedItemSize = .init(width: 393 , height: 500)
        $0.scrollDirection = .horizontal
    })
    private let pageControl = UIPageControl()
    
    // MARK: Life Cycle - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpStyle()
        setUpLayout()
        setUpConstraint()
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
        
        pageControl.do {
            $0.numberOfPages = images.count
            $0.currentPage = currentPage
        }
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [
            collectionView,
            pageControl
        ].forEach { self.view.addSubview($0) }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(500)
        }
        
        pageControl.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(collectionView.snp.bottom)
            $0.height.equalTo(40)
        }
    }
    
    // MARK: pageControl Action
    private lazy var pageChangeAction = UIAction { [weak self] action in
        guard let sender = action.sender as? UIPageControl, let self = self else { return }
        let currentPage = sender.currentPage
        let xOffset = CGFloat(currentPage) * collectionView.frame.size.width
        collectionView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: true)
    }

}

extension CarouselViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = currentPage
    }
}

extension CarouselViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "justImageCell", for: indexPath)
        cell.backgroundColor = .clear
        let imageView = UIImageView(image: UIImage(named: images[indexPath.item]))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame = cell.bounds
        cell.addSubview(imageView)
        return cell
    }
}
