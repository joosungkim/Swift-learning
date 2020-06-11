//
//  DetailsViewController.swift
//  ToDoList
//
//  Created by JSK on 2020/06/08.
//  Copyright © 2020 JSK. All rights reserved.
//

import Foundation
import UIKit

//API key: AIzaSyCCV24QMHnjXD9hmAMAj8PDSpC9Ie7pKs0


class DetailsViewController: UIViewController {
    
    let cellId: String = "cellid"
    var safeArea: UILayoutGuide!
    let mapView = MapViewController()
    weak var delegate: DetailsViewControllerDelegate?
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        return cv
    } ()
    
    lazy var datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.translatesAutoresizingMaskIntoConstraints = false
        dp.datePickerMode = .date
        return dp
    } ()
    
    let titleField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .webSearch
        return tf
    }()
    
    let locationButton: UIButton = {
        let locBut = UIButton(type: .system)
        locBut.translatesAutoresizingMaskIntoConstraints = false
        return locBut
    } ()
    
    let saveButton: UIButton = {
       let saveBut = UIButton(type: .system)
       saveBut.translatesAutoresizingMaskIntoConstraints = false
       return saveBut
    } ()
    
    let deleteButton: UIButton = {
       let delBut = UIButton(type: .system)
       delBut.translatesAutoresizingMaskIntoConstraints = false
       return delBut
    } ()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.layoutMarginsGuide
        setUI()
        
    }
    
    func setUI() {
        //view.addSubview(collectionView)
        view.addSubview(titleField)
        view.addSubview(datePicker)
        view.addSubview(locationButton)
        view.addSubview(saveButton)
        view.addSubview(deleteButton)
        setConstraints()
    }
    
    func setConstraints() {
        view.backgroundColor = .white
        titleField.backgroundColor = .white
        titleField.layer.borderColor = UIColor.black.cgColor
        titleField.layer.borderWidth = 2
        titleField.layer.cornerRadius = 12
        
        titleField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20).isActive = true
        titleField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        titleField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        titleField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        datePicker.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 40).isActive = true
        datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        datePicker.backgroundColor = .white
        
        locationButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 40).isActive = true
        locationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        locationButton.layer.cornerRadius = 12
        locationButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        locationButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        locationButton.backgroundColor = .orange
        locationButton.setTitle("location", for: .normal)
        locationButton.addTarget(self, action: #selector(handleLocationButton), for: .touchUpInside)
        
        saveButton.topAnchor.constraint(equalTo: locationButton.bottomAnchor, constant: 40).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.layer.cornerRadius = 12
        saveButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        saveButton.backgroundColor = .blue
        saveButton.setTitle("save", for: .normal)
        saveButton.addTarget(self, action: #selector(handleSaveButton), for: .touchUpInside)
        
        deleteButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 40).isActive = true
        deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        deleteButton.layer.cornerRadius = 12
        deleteButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        deleteButton.backgroundColor = .red
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.addTarget(self, action: #selector(handleDeleteButton), for: .touchUpInside)
    }
    
    @objc func handleLocationButton() {
        view.endEditing(true)
        navigationController?.pushViewController(mapView, animated: true)
    }
    
    @objc func handleSaveButton() {
        view.endEditing(true)
        let newTask = Task(title: titleField.text ?? "not passed in", dueDate: datePicker.date, location: (37.503204, 127.025543))
        delegate?.addNewTask(newTask)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleDeleteButton() {
        view.endEditing(true)
        delegate?.deleteTask()
        navigationController?.popViewController(animated: true)
    }
}

extension DetailsViewController: UICollectionViewDelegate ,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        return cell
    }
}

protocol DetailsViewControllerDelegate: class {
    func addNewTask(_ newTask: Task)
    func deleteTask()
}
