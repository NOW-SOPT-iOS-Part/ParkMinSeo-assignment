//
//  HomeViewController.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 6/6/24.
//

import UIKit
import SnapKit
import Then
import RxCocoa
import RxDataSources

final class HomeViewController: UIViewController {
    
    // MARK: Properties
    private let viewModel = HomeViewModel()
    
    // MARK: View
    private let rootView = HomeView()
    private let topAboveView = UIView()
    private let segmentView = SegmentControlView()
        
    // MARK: Life Cycle - loadView
    override func loadView() {
        self.view = rootView
    }
    
    // MARK: Life Cycle - viewDidLoad
    override func viewDidLoad() {
        setUpView()
        setUpLayout()
        setUpConstraint()
        bind()
    }
    
    // MARK: setUpView
    private func setUpView() {
        rootView.mainContentView.delegate = self
        rootView.mainContentView.dataSource = self
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [
            topAboveView,
            segmentView
        ].forEach { self.view.addSubview($0) }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        topAboveView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        segmentView.snp.makeConstraints {
            $0.top.equalTo(topAboveView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
        }
    }
}

// MARK: Bind
extension HomeViewController {
    private func bind() {
        
        let segmentOutput = self.segmentView.bind(segments: self.viewModel.segments, disposeBag: self.viewModel.disposeBag)
        
        let viewModelOutput = self.viewModel.transform(
            input: .init(
                cellDidTap: segmentOutput
            )
        )
        
//        let dataSource = RxCollectionViewSectionedReloadDataSource<<#Section: SectionModelType#>>
    }
}

// MARK: UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    // MARK: 별도의 DiffableDataSource 없이 Header 등록 시 필요합니다
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CVHeaderView.className, for: indexPath) as? CVHeaderView,
                MainCVSection.allCases[indexPath.section] != .topCarousel
        else { return UICollectionReusableView() }
                
        let headerData = MainCVSection.allCases[indexPath.section].getHeaderContent()
        
        header.fetchData(headerData)
        return header
    }
}

// MARK: UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return MainCVSection.allCases.count
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch MainCVSection.allCases[section] {
        case .topCarousel:
            return 1
        case .recommend, .event, .fantastic, .stream:
            return 4
        case .ads:
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch MainCVSection.allCases[indexPath.section] {
        
        case .topCarousel:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopCarouselCVCell.className, for: indexPath) as? TopCarouselCVCell else {
                return UICollectionViewCell() }
            return cell
        case .recommend, .event, .fantastic:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NormalContentCVCell.className, for: indexPath) as? NormalContentCVCell else { return UICollectionViewCell() }
            cell.fetchData(viewModel.normalData.value[indexPath.row])
            return cell
        case .stream:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StreamContentCVCell.className, for: indexPath) as? StreamContentCVCell else { return UICollectionViewCell() }
            cell.fetchData(viewModel.streamData.value[indexPath.row])
            return cell
        case .ads:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdContentCVCell.className, for: indexPath) as? AdContentCVCell else { return UICollectionViewCell() }
            cell.fetchData(.init(contentId: 1, image: "longTabImage1"))
            return cell
        }
    }
    
    
}
