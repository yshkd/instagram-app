//
//  ProfileInfoCollectionReusableView.swift
//  instagram
//
//  Created by yushi kida on 2020/09/30.
//  Copyright © 2020 yushi kida. All rights reserved.
//

import UIKit

class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBlue
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
