//
//  IntroPageView.swift
//  IntroPage
//
//  Created by JSK on 2020/06/17.
//  Copyright © 2020 JSK. All rights reserved.
//

import Foundation
import UIKit

class IntroPageView: UIView {
    let introCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.isPagingEnabled = true
        return cv
    } ()
    

    
    private func setupUI() { //encapsulation??
        addSubview(introCV)
        
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        introCV.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        introCV.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        introCV.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        introCV.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        introCV.backgroundColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



