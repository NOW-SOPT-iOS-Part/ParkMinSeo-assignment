//
//  HomeViewController.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 6/6/24.
//

import UIKit
import SnapKit
import Then
import RxSwift
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
//        rootView.mainContentView.delegate = self
//        rootView.mainContentView.dataSource = self
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
        
        let dataSource = RxCollectionViewSectionedReloadDataSource<SectionModel<MainCVSection, MainCVItem>>(
            configureCell: { dataSource, collectionView, indexPath, item in
                switch item {
                case .topCarousel(let content):
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopCarouselCVCell.className, for: indexPath) as? TopCarouselCVCell else { return UICollectionViewCell() }
                    cell.bind(images: Observable.just(content), currentPage: self.viewModel.currentPage, disposeBag: self.viewModel.disposeBag)
                    return cell
                case .recommend(let content), .event(let content), .fantastic(let content):
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NormalContentCVCell.className, for: indexPath) as? NormalContentCVCell else { return UICollectionViewCell() }
                    cell.fetchData(content)
                    return cell
                case .stream(let content):
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StreamContentCVCell.className, for: indexPath) as? StreamContentCVCell else { return UICollectionViewCell() }
                    cell.fetchData(content)
                    return cell
                case .ads(let content):
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdContentCVCell.className, for: indexPath) as? AdContentCVCell else { return UICollectionViewCell() }
                    cell.fetchData(content)
                    return cell
                }
            },
            configureSupplementaryView: { dataSource, collectionView, kind, indexPath in
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CVHeaderView.className, for: indexPath) as? CVHeaderView,
                      MainCVSection.allCases[indexPath.section] != .topCarousel
                else { return UICollectionReusableView() }
                
                let headerData = MainCVSection.allCases[indexPath.section].getHeaderContent()
                header.fetchData(headerData)
                return header
            }
        )
        
        viewModelOutput.sections
            .asDriver(onErrorJustReturn: [])
            .drive(rootView.mainContentView.rx.items(dataSource: dataSource))
            .disposed(by: self.viewModel.disposeBag)
    }
}
