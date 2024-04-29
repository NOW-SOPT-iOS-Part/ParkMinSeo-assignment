//
//  adContentCVCell.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/29/24.
//

import UIKit
import SnapKit
import Then


class adContentCVCell: UICollectionViewCell {
    
    // MARK: Properties
    private var cellContent: adContent = adContent(contentId: -1, image: "longTabImage1")
    
    // MARK: Views
    /// 컨텐츠 이미지
    private let contentImageView = UIImageView()
    
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
        contentImageView.do {
            $0.image = UIImage(named: cellContent.image)
            $0.contentMode = .scaleAspectFill
            $0.cornerRounding(3)
        }
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [
            contentImageView
        ].forEach { self.contentView.addSubview($0) }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        contentImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
        
}

// MARK: interface function
extension adContentCVCell {
    func fetchData(_ data: adContent) {
        self.cellContent = data
    }
}

#Preview {
    adContentCVCell()
}
