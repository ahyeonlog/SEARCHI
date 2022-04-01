//
//  DetailImageView.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/04/01.
//

import UIKit
import SnapKit

final class DetailImageView: UIView, ViewRepresentable {
    let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
        $0.isUserInteractionEnabled = true
        $0.keyboardDismissMode = .onDrag
    }
    let contentView = UIView()
    
    let imageView = ScaledHeightImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    let labelStack = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .fill
        $0.spacing = 16
    }
    
    let siteNameLabel = UILabel().then {
        $0.textColor = .label
    }
    let datetimeLabel = UILabel().then {
        $0.textColor = .label
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension DetailImageView {
    func setUpViews() {
        backgroundColor = .systemBackground
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(imageView)
        
        contentView.addSubview(labelStack)
        labelStack.addArrangedSubview(siteNameLabel)
        labelStack.addArrangedSubview(datetimeLabel)
    }
    
    func setUpConstraints() {
        scrollView.snp.makeConstraints {
            $0.top.trailing.leading.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.top.trailing.leading.bottom.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top)
            $0.leading.trailing.equalToSuperview()
        }
        
        labelStack.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-16).priority(250)
        }
    }
}

class ScaledHeightImageView: UIImageView {
    override var intrinsicContentSize: CGSize {
        if let myImage = self.image {
            let myImageWidth = myImage.size.width
            let myImageHeight = myImage.size.height
            let myViewWidth = self.frame.size.width
 
            let ratio = myViewWidth/myImageWidth
            let scaledHeight = myImageHeight * ratio
            return CGSize(width: myViewWidth, height: scaledHeight)
        }
        return CGSize(width: -1.0, height: -1.0)
    }

}
