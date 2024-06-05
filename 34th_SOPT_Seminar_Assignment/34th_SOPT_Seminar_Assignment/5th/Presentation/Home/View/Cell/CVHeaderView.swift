//
//  CVHeaderView.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 6/6/24.
//

import UIKit
import SnapKit
import Then

final class CVHeaderView: UICollectionReusableView {
    
    // MARK: Properties
    private var cellContent: HeaderContent?
    
    // MARK: Views
    /// 컨텐츠 뷰 헤더 타이틀
    private let titleLabel = UILabel()
    /// 우측 버튼
    private let rightButton = UIButton()
    
    // MARK: header init
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
    
    // MARK: prepareForReuse
    override func prepareForReuse() {
        super.prepareForReuse()
        setUpStyle()
    }
    
    // MARK: setUpView
    private func setUpView() {
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        guard let cellContent = self.cellContent else { return }
        
        titleLabel.do {
            let attrStr = NSAttributedString(
                string: cellContent.labelTitle,
                attributes: [
                    .font : UIFont.pretendard(.w600, size: 15),
                    .foregroundColor : UIColor.white,
                  ])
            $0.attributedText = attrStr
        }
        
        rightButton.do {
            guard cellContent.showButton else { return }
            let attrStr = NSAttributedString(
                string: "전체보기",
                attributes: [
                    .font : UIFont.pretendard(.w500, size: 11),
                    .foregroundColor : UIColor.grayScale(.r156),
                  ])
            $0.setAttributedTitle(attrStr, for: .normal)
            $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            $0.imageView?.tintColor =  .grayScale(.r156)
            $0.semanticContentAttribute = .forceRightToLeft
        }
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [
            titleLabel,
            rightButton
        ].forEach { self.addSubview($0) }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(rightButton.snp.leading).priority(.low)
        }
        
        rightButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
    
}

// MARK: interface function
extension CVHeaderView {
    func fetchData(_ data: HeaderContent) {
        self.cellContent = data
        setUpStyle()
    }
}
