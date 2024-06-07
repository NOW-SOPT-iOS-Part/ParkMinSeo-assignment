//
//  SegmentCVCell.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 6/6/24.
//

import UIKit
import SnapKit
import Then

final class SegmentCVCell: UICollectionViewCell {
    
    // MARK: Properties
    private var segment: Segments?
    
    // UICollectionViewCell에 내장된 isSelected 프로퍼티를 사용하는데,
    // rx-proxy를 사용할 만큼 비중 있는 비동기 처리 로직이 아니라고 판단하여 didSet으로 두었습니다!
    override var isSelected: Bool {
        didSet{
            setUpStyle()
        }
    }
    
    // MARK: Views
    private let segmentLabel = UILabel()
    private let underlineView = UIView()
    
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
        guard let segment = segment else { return }
        
        segmentLabel.do {
            let attrStr = NSAttributedString(
                string: segment.rawValue,
                attributes: [
                    .font : UIFont.pretendard(.w400, size: 17),
                    .foregroundColor : UIColor.white,
                  ])
            $0.attributedText = attrStr
        }
        
        underlineView.do {
            $0.backgroundColor = .white
            $0.isHidden = !self.isSelected
        }
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [
            underlineView,
            segmentLabel
        ].forEach { self.contentView.addSubview($0) }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        segmentLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        underlineView.snp.makeConstraints {
            $0.width.equalTo(segmentLabel)
            $0.height.equalTo(2)
            $0.top.equalTo(segmentLabel.snp.bottom).offset(5)
            $0.centerX.equalTo(segmentLabel)
        }
    }
        
}

// MARK: interface function
extension SegmentCVCell {
    func fetchData(_ data: Segments) {
        self.segment = data
        setUpStyle()
    }
}
