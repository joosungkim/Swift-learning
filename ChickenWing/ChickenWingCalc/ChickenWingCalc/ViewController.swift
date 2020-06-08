//
//  ViewController.swift
//  ChickenWingCalc
//
//  Created by JSK on 2020/06/04.
//  Copyright © 2020 JSK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view is UIView as well
        view.backgroundColor = .white //UIColor omitted infront
        let blueSquare: UIView = UIView() //UIView is the superclass of all ui views
        //coder is mostly for storyboard
        blueSquare.backgroundColor = UIColor.blue
        blueSquare.translatesAutoresizingMaskIntoConstraints = false
        //we're using constraints not frames so very necessary *****
        // made
        view.addSubview(blueSquare)
        //subviews = array of all subviews in self
        
        blueSquare.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        //blueSquare.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        blueSquare.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 40).isActive = true
        //isActive makes the constraint come alive ********
        //anchors come from the top left of any view
        blueSquare.widthAnchor.constraint(equalToConstant: 40).isActive = true
        blueSquare.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //11 pro 375 * 812 , safearea comes after the bezel
        
        
        let yellowCircle: UIView = UIView()
        yellowCircle.backgroundColor = .yellow
        yellowCircle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yellowCircle)
        yellowCircle.widthAnchor.constraint(equalToConstant: 60).isActive = true
        yellowCircle.heightAnchor.constraint(equalToConstant: 60).isActive = true
        yellowCircle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowCircle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        //centeranchor works from center of object as well
        yellowCircle.layer.cornerRadius = 30
        
        let greenButton: UIButton = UIButton(type: .system) //the most common button
        // can explore with items after .
        greenButton.backgroundColor = .green
        greenButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greenButton)
        
        greenButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        //greenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        greenButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        greenButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60).isActive = true
        greenButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60).isActive = true
        
        let topRightSquare: UIView = UIView()
        topRightSquare.backgroundColor = .blue
        topRightSquare.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topRightSquare)
        topRightSquare.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -40).isActive = true
        topRightSquare.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topRightSquare.widthAnchor.constraint(equalToConstant: 40).isActive = true
        topRightSquare.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let centerLeftSquare:UIView = UIView()
        view.addSubview(centerLeftSquare)
        centerLeftSquare.backgroundColor = .blue
        centerLeftSquare.translatesAutoresizingMaskIntoConstraints = false
        centerLeftSquare.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        centerLeftSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        centerLeftSquare.widthAnchor.constraint(equalToConstant: 40).isActive = true
        centerLeftSquare.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        //Extension is for repeated process
        let str: String = "hello world"
        print(changeMyString(inputString: str))
        print(str.isHelloWorld())
    }

    func changeMyString(inputString: String) -> String {
        return "new String"
    }

}

//take a look at extension6050
//extending pre-existing class
extension String {
    func changeMyString() -> String {
        return "new String"
    }
    
    func isHelloWorld() -> Bool {
        return self == "Hello World!"
    }
}
