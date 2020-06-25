//
//  CustomCollectionViewCell.swift
//  IntroPage
//
//  Created by JSK on 2020/06/17.
//  Copyright © 2020 JSK. All rights reserved.
//

import Foundation
import UIKit

class IntroPageCell: UICollectionViewCell {
    let introImageView: UIImageView = {
        let iv = UIImageView(image: UIImage.init(named: "IntroPage1"))
        iv.translatesAutoresizingMaskIntoConstraints =  false
        iv.contentMode = .scaleAspectFit
        return iv
    } ()
    
    let introPageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.numberOfPages = 3
        pc.currentPageIndicatorTintColor = UIColor.init(red: 59/255, green: 198/255, blue: 254/255, alpha: 1)
        pc.backgroundColor = .white
        pc.pageIndicatorTintColor =  UIColor.init(red: 59/255, green: 198/255, blue: 254/255, alpha: 0.5)

        return pc
    }()
    
    let introTextView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.textColor = UIColor.init(red: 59/255, green: 198/255, blue: 254/255, alpha: 1)
        tv.font = UIFont.init(name: "NotoSansCJKkr-Medium", size: 24)
        tv.textAlignment = .center
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.isSelectable = false
        tv.isPagingEnabled = false
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("123")
    }
    
    private func setupUI() {
        addSubview(introPageControl)
        addSubview(introImageView)
        addSubview(introTextView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        introImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        introImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        introImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.8).isActive = true
        introImageView.backgroundColor = .white
        
        introTextView.topAnchor.constraint(equalTo: introImageView.bottomAnchor).isActive = true
        introTextView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        introTextView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true

        introPageControl.topAnchor.constraint(equalTo: introTextView.bottomAnchor).isActive = true
        introPageControl.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier:  0.05).isActive = true
        introPageControl.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
    }
}
