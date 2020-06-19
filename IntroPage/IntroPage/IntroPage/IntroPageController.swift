//
//  ViewController.swift
//  IntroPage
//
//  Created by JSK on 2020/06/16.
//  Copyright © 2020 JSK. All rights reserved.
//
import Foundation
import UIKit

class IntroPageController: UIViewController  {
    
    let introcv = IntroPageView()
    let pageCellID: String = "pageCellID"
    var imageArray =  ImageData()
    var textArray = TextData()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        view.addSubview(introcv)
        introcv.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }
    
    private func setupConstraints() {
        introcv.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        introcv.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        introcv.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        introcv.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true    }
    
    func configureCollectionView() {
        introcv.introCV.delegate = self
        introcv.introCV.dataSource = self
        introcv.introCV.register(IntroPageCell.self, forCellWithReuseIdentifier: pageCellID)
    }
}

extension IntroPageController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(imageArray.introImages.count)
//        return imageArray.introImages.count
        return 3
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pageCellID, for: indexPath) as! IntroPageCell
        let imageName = imageArray.introImages[indexPath.item]
        let textBody = textArray.introTexts[indexPath.item]
        cell.introImageView.image = UIImage(named: imageName)
        cell.introTextView.text = textBody
        cell.introPageControl.currentPage = indexPath.item
        //how to init
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIScreen.main.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
