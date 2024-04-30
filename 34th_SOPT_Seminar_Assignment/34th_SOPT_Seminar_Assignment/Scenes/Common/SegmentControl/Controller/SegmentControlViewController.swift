//
//  SegmentControlViewController.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/30/24.
//

import UIKit

final class SegmentControlViewController: UIViewController {
    
    // MARK: View
    private let segmentControlView = SegmentControlView()
    
    // MARK: Life Cycle - loadView
    override func loadView() {
        super.loadView()
        self.view = segmentControlView
    }
    
    // MARK: Life Cycle - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentControlView.delegate = self
        segmentControlView.dataSource = self
        segmentControlView.selectItem(at: .init(item: 0, section: 0), animated: false, scrollPosition: .centeredHorizontally)
    }
}

// MARK: UICollectionViewDelegate
extension SegmentControlViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(Segments.allCases[indexPath.row].rawValue)
    }
}

// MARK: UICollectionViewDataSource
extension SegmentControlViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Segments.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SegmentCVCell.className, for: indexPath) as? SegmentCVCell else { return UICollectionViewCell() }
        cell.fetchData(Segments.allCases[indexPath.row])
        return cell
    }
}

#Preview {
    SegmentControlViewController()
}
