//
//  ChickenWingViewController.swift
//  ChickenWingCalc
//
//  Created by JSK on 2020/06/04.
//  Copyright © 2020 JSK. All rights reserved.
//

import Foundation
import UIKit

class ChickenWingViewController: UIViewController {
    //stack of views
    
    let secondPage = SecondPageController()  //instantiate as object to push onto the stack
    //let calcButton = UIButton(type: .system)
    let pplCounter = UIStepper()
    let pplCountView = UITextView()
    let price: Int = 3
    
    lazy var calculateButton: UIButton = { //style we want
        let but = UIButton(type: .system)
        but.translatesAutoresizingMaskIntoConstraints = false //look into def and function
        but.backgroundColor = .black
        but.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside) //action will be function or action, #selector
        //lazy call allows for self because instantiation happens after method is called
        return but
    }()
    
    let priceTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .clear
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .numberPad
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.cornerRadius = 12
        tf.textAlignment = .center
        
        return tf
    }()
    
    func setUI() { //all subviews handled at once
        view.addSubview(calculateButton)
        view.addSubview(priceTextField)
        setConstraints()
    }
    
    func setConstraints() { //all subviews handled at once
        calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calculateButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        calculateButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        calculateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        calculateButton.layer.cornerRadius = 25
        calculateButton.setTitle("Calculate!", for: .normal)
        
        priceTextField.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 50).isActive = true
        priceTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        priceTextField.widthAnchor.constraint(equalTo: calculateButton.widthAnchor).isActive = true
        priceTextField.heightAnchor.constraint(equalTo: calculateButton.heightAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad() //inheritted
        view.backgroundColor = .white
        setUI()
    
        //configureButton()
        configurePplCounter()
        configurePplCountView()
        
        //print(self.viewControllers) //doesn't show the rootview
        //pushViewController(secondPage, animated: true)
        
    
        
    }
    
//    func configureButton () {
//        calcButton.translatesAutoresizingMaskIntoConstraints  = false
//        calcButton.backgroundColor = .black
//        view.addSubview(calcButton)
//
//        calcButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        calcButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        calcButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        calcButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        calcButton.layer.cornerRadius = 25
//        calcButton.setTitle("Calculate!", for: .normal)
//        calcButton.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside) //action will be function or action, #selector
//
//    }
    
    @objc func handleButtonClick () { //handler functions will need @objc handle
        
        view.endEditing(true)
        //get num from textfield
        guard let inText = priceTextField.text, let money = Int(inText) else { return }
        //conditionals happen in order / no parellel
        //calculate number
        let number = numWings(money)
        //pass onto second page
        secondPage.numWings = number
        secondPage.delegate = self
        navigationController?.pushViewController(secondPage, animated: true)
       
    }
    
    func configurePplCounter () {
        pplCounter.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pplCounter)
        pplCounter.backgroundColor = .white
        
        pplCounter.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50).isActive = true
        pplCounter.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        pplCounter.layer.cornerRadius = 10
        pplCounter.addTarget(self, action: #selector(handleStepperClick), for: .valueChanged)
    }
    
    @objc func handleStepperClick() {
        print(pplCounter.value)
        pplCountView.text = String(pplCounter.value)
    }
    
    func numWings(_ num: Int) -> Int {
        return num / price
    }
    
    func configurePplCountView () {
        pplCountView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pplCountView)
        pplCountView.backgroundColor = .white
        pplCountView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50).isActive = true
        pplCountView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        pplCountView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        pplCountView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        pplCountView.layer.cornerRadius = 10
        pplCountView.isEditable = true
        pplCountView.text = String(pplCounter.value.rounded())
        pplCountView.textAlignment = .center
        //pplCountView.textColor()
        
    }
}


extension ChickenWingViewController: SecondPageControllerDelegate { //extension used in this case to make code readable
    
    func removeTextFieldContents() {
        priceTextField.text = ""
    }
}
