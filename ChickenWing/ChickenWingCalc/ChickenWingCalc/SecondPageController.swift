//
//  SecondPageController.swift
//  ChickenWingCalc
//
//  Created by JSK on 2020/06/04.
//  Copyright © 2020 JSK. All rights reserved.
//

import Foundation
import UIKit

protocol SecondPageControllerDelegate: class { //compares to interface of java
    func removeTextFieldContents()
}

class SecondPageController: UIViewController {
    
    let backButton = UIButton(type: .system)
    var numWings: Int = 0 //? or "=0" or !
    weak var delegate: SecondPageControllerDelegate?
    //weak varaible allows for memory retain cycle to be released when unused
    // only works for class
    
    
    lazy var numWingsLabel: UILabel = {
        let wingl = UILabel()
        wingl.translatesAutoresizingMaskIntoConstraints = false
        wingl.text = String(numWings)
        
        return wingl
    } ()
    
    lazy var wingPic: UIImageView = {
        let wpic = UIImageView()
        wpic.translatesAutoresizingMaskIntoConstraints = false
        wpic.backgroundColor = .red
        wpic.image = UIImage(named: "wingPicPng")
        wpic.contentMode = .scaleAspectFit
        return wpic
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureBackButton()
        view.addSubview(numWingsLabel)
        view.addSubview(wingPic)
        setConstraints()
    }
    
    
    
    func setConstraints() { //all subviews handled at once
        numWingsLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 50).isActive = true
        numWingsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        numWingsLabel.widthAnchor.constraint(equalTo: backButton.widthAnchor).isActive = true
        numWingsLabel.heightAnchor.constraint(equalTo: backButton.heightAnchor).isActive = true
        wingPic.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -50).isActive = true
        wingPic.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        wingPic.widthAnchor.constraint(equalTo: backButton.widthAnchor).isActive = true
        wingPic.heightAnchor.constraint(equalTo: backButton.heightAnchor).isActive = true
    }
    
    func configureBackButton () {
        backButton.translatesAutoresizingMaskIntoConstraints  = false
        backButton.backgroundColor = .black
        view.addSubview(backButton)
        
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.layer.cornerRadius = 25
        backButton.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside) //action will be function or action, #selector
        
    }
    
    
    
    
    
    
    @objc func handleButtonClick () { //handler functions will need @objc handle
        delegate?.removeTextFieldContents()
        navigationController?.popViewController(animated: true)
    }
    
    //we don't want cross reference of two pages or controllers, because of memory release failure (retain cycle)
}
