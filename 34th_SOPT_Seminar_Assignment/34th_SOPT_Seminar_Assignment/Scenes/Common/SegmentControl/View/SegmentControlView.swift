//
//  SegmentControlView.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/30/24.
//

import UIKit
import SnapKit
import Then

final class SegmentControlView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.itemSize = CGSize(width: 100, height: 50)
            $0.minimumLineSpacing = 8
            $0.minimumInteritemSpacing = 10
            $0.scrollDirection = .horizontal
        })
        registerCells()
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func registerCells() {
        self.register(SegmentCVCell.self, forCellWithReuseIdentifier: SegmentCVCell.className)
    }
}
