//
//  StreamContentCVCell.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 6/6/24.
//

import UIKit
import SnapKit
import Then

class StreamContentCVCell: UICollectionViewCell {
    
    // MARK: Properties
    private var cellContent: StreamContent?
    
    // MARK: Views
    /// 컨텐츠 이미지
    private let contentImageView = UIImageView()
    /// 순위 라벨
    private let rankLabel = UILabel()
    /// 방송사 라벨
    private let broadcastingCompLabel = UILabel()
    /// 컨텐츠 타이틀
    private let contentTitle = UILabel()
    /// 시청률 라벨
    private let viewershipLabel = UILabel()
    
    
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
        
        rankLabel.do {
            let attrStr = NSAttributedString(
                string: String(cellContent.rank),
                attributes: [
                    .font : UIFont.pretendard(.w700, size: 19),
                    .foregroundColor : UIColor.white,
                    .obliqueness: 0.3
                  ])
            $0.attributedText = attrStr
        }
        

        broadcastingCompLabel.do {
            let attrStr = NSAttributedString(
                string: String(cellContent.broadcastingCompany),
                attributes: [
                    .font : UIFont.pretendard(.w400, size: 10),
                    .foregroundColor : UIColor.white
                  ])
            $0.attributedText = attrStr
        }

        
        contentTitle.do {
            let attrStr = NSAttributedString(
                string: cellContent.title,
                attributes: [
                    .font : UIFont.pretendard(.w400, size: 10),
                    .foregroundColor : UIColor.grayScale(.r156)
                  ])
            $0.attributedText = attrStr
        }
        
        viewershipLabel.do {
            let attrStr = NSAttributedString(
                string: "\(cellContent.viewerShip)%",
                attributes: [
                    .font : UIFont.pretendard(.w400, size: 10),
                    .foregroundColor : UIColor.grayScale(.r156)
                  ])
            $0.attributedText = attrStr
        }
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [
            contentImageView,
            rankLabel,
            broadcastingCompLabel,
            contentTitle,
            viewershipLabel
        ].forEach { self.contentView.addSubview($0) }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        
        contentImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        rankLabel.snp.makeConstraints {
            $0.top.equalTo(contentImageView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(6)
            $0.size.equalTo(30)
        }
        
        broadcastingCompLabel.snp.makeConstraints {
            $0.top.equalTo(contentImageView.snp.bottom).offset(12)
            $0.leading.equalTo(rankLabel.snp.trailing)
            $0.trailing.equalToSuperview().offset(-6).priority(.low)
        }
        
        contentTitle.snp.makeConstraints {
            $0.top.equalTo(broadcastingCompLabel.snp.bottom).offset(2)
            $0.leading.equalTo(broadcastingCompLabel)
            $0.trailing.equalToSuperview().offset(-6).priority(.low)
        }
        
        viewershipLabel.snp.makeConstraints {
            $0.top.equalTo(contentTitle.snp.bottom).offset(2)
            $0.leading.equalTo(broadcastingCompLabel)
            $0.trailing.equalToSuperview().offset(-6).priority(.low)
        }
    }
        
}

// MARK: interface function
extension StreamContentCVCell {
    
    func fetchData(_ data: StreamContent) {
        self.cellContent = data
        setUpStyle()
    }
}
