//
//  SegmentControlView.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 6/6/24.
//

import UIKit
import SnapKit
import Then 
import RxSwift
import RxCocoa

final class SegmentControlView: UICollectionView {
    
    // MARK: view init
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: SegmentControlView.createLayout())
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: setUpView
    private func setUpView() {
        self.backgroundColor = .clear
        self.showsHorizontalScrollIndicator = false
        self.register(SegmentCVCell.self, forCellWithReuseIdentifier: SegmentCVCell.className)
    }
    
    // MARK: Bind Data
    func bind(segments: Observable<[Segments]>, cellDidTap: PublishRelay<Segments>, disposeBag: DisposeBag) {
        
        segments.bind(
            to: self.rx.items(
                cellIdentifier: SegmentCVCell.className,
                cellType: SegmentCVCell.self
            )
        ) { row, item, cell in
            cell.fetchData(item)
        }
        .disposed(by: disposeBag)
        
        self.rx.modelSelected(Segments.self)
            .bind(to: cellDidTap)
            .disposed(by: disposeBag)
    }
}

// MARK: Layout Configuration
extension SegmentControlView {
    private static func createLayout() -> UICollectionViewFlowLayout {
        return UICollectionViewFlowLayout().then {
            $0.itemSize = CGSize(width: 80, height: 50)
            $0.minimumLineSpacing = 8
            $0.minimumInteritemSpacing = 10
            $0.scrollDirection = .horizontal
        }
    }
}
