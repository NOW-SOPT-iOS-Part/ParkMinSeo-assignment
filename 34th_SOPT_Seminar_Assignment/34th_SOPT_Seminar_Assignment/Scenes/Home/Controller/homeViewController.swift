//
//  homeViewController.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/29/24.
//

import UIKit

final class homeViewController: UIViewController {
    
    // MARK: View
    private let rootView = homeView()
        
    // MARK: Life Cycle - loadView
    override func loadView() {
        self.view = rootView
    }
    
    // MARK: Life Cycle - viewDidLoad
    override func viewDidLoad() {
        rootView.mainCollectionView.delegate = self
        rootView.mainCollectionView.dataSource = self
    }
}

extension homeViewController: UICollectionViewDelegate {
    
}

extension homeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: normalContentCVCell.className, for: indexPath) as? normalContentCVCell else { return UICollectionViewCell() }
        cell.fetchData(.init())
        return cell
    }
    
    
}
