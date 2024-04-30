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
        mainContentView.backgroundColor = .clear
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [
            mainContentView
        ].forEach { self.addSubview($0) }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        mainContentView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
