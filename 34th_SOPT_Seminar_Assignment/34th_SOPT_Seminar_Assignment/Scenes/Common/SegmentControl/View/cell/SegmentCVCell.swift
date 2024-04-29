//
//  SegmentCVCell.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/30/24.
//

import UIKit
import SnapKit
import Then

final class SegmentCVCell: UICollectionViewCell {
    
    // MARK: Properties
    private var segment: Segments?
    
    override var isSelected: Bool {
        didSet{
            setUpStyle()
        }
    }
    
    // MARK: Views
    private let segmentLabel = UILabel()
    
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
        segmentLabel.do {
            let attrStr = NSAttributedString(
                string: segment?.rawValue ?? "",
                attributes: [
                    .font : UIFont.pretendard(.w400, size: 17),
                    .foregroundColor : UIColor.white,
                    .underlineStyle : self.isSelected ? NSUnderlineStyle.thick : [],
                    .kern : 5.0
                  ])
            $0.attributedText = attrStr
        }
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [
            segmentLabel
        ].forEach { self.contentView.addSubview($0) }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        segmentLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
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
