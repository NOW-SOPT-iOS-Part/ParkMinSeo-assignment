//
//  NormalContentCVCell.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 6/6/24.
//

import UIKit
import SnapKit
import Then

class NormalContentCVCell: UICollectionViewCell {
    
    // MARK: Properties
    private var cellContent: NormalContent?
    
    // MARK: Views
    private let contentImageView = UIImageView()
    private let contentTitle = UILabel()
    
    // MARK: cell init
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
        
        contentImageView.do {
            $0.image = UIImage(named: cellContent.image)
            $0.contentMode = .scaleAspectFill
            $0.cornerRounding(3)
        }
        
        contentTitle.do {
            let attrStr = NSAttributedString(
                string: cellContent.title,
                attributes: [
                    .font : UIFont.pretendard(.w500, size: 10),
                    .foregroundColor : UIColor.grayScale(.r156)
                  ])
            $0.attributedText = attrStr
        }
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [
            contentImageView,
            contentTitle
        ].forEach { self.contentView.addSubview($0) }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        
        contentTitle.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-3)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().priority(.low)
        }
        
        contentImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(contentTitle.snp.top).offset(-3)
        }
    }
        
}

// MARK: interface function
extension NormalContentCVCell {
    
    func fetchData(_ data: NormalContent) {
        self.cellContent = data
        setUpStyle()
    }
}
