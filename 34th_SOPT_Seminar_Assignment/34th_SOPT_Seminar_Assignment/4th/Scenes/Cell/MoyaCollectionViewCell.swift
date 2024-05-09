//
//  MoyaCollectionViewCell.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 5/10/24.
//

import UIKit
import SnapKit
import Then

final class MoyaCollectionViewCell: UICollectionViewCell {
    // MARK: Variables
    
    // MARK: Views
    
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

    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [

        ].forEach { self.contentView.addSubview($0) }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {

    }
}
