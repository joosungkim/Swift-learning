//
//  ViewController.swift
//  ToDoList
//
//  Created by JSK on 2020/06/08.
//  Copyright © 2020 JSK. All rights reserved.
//

import UIKit
import Foundation

class CustomCell: UITableViewCell {
    
    var tvController: ViewController?
    var customBackgroundColor: UIColor?
    let squareView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let descriptionLabel: UILabel = {
        let la = UILabel()
        la.translatesAutoresizingMaskIntoConstraints = false
        la.font = .boldSystemFont(ofSize: 12)
        return la
    }()
    
    let cellButton: UIButton = {
        let cb = UIButton(type: .system)
        cb.translatesAutoresizingMaskIntoConstraints = false
        cb.layer.borderColor = UIColor.black.cgColor
        cb.setTitle("Go", for: .normal)
        
        return cb
    }()
    
    func setBoxColor(_ color: UIColor?) {
        squareView.backgroundColor = color
    }
    
    func setLabelText(_ text: String) {
        descriptionLabel.text = text
    }
    
    func setUI() {
        addSubview(squareView)
        addSubview(descriptionLabel)
        addSubview(cellButton)
        setConstraints()

    }
    
    func setConstraints() {
        squareView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        squareView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        squareView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        squareView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: squareView.topAnchor).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cellButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        cellButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cellButton.layer.cornerRadius = 10
        cellButton.layer.borderColor = UIColor.black.cgColor
        cellButton.layer.borderWidth = 2
        cellButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        cellButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //backgroundColor = .green
        setUI()
        //setAction()
    }
    
    required init?(coder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        return nil
    }
    
}

class Header: UITableViewHeaderFooterView {
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

    }

    required init?(coder: NSCoder) {
        return nil
        //fatalError("init(coder:) has not been implemented")
    }

    func setUI() {
        addSubview(addButton)
        addButton.backgroundColor = .cyan
        addButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        addButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        addButton.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }

    let addButton: UIButton = {
        let but = UIButton()
        but.translatesAutoresizingMaskIntoConstraints = false
        but.setTitle("Add Task!", for: .normal)
        but.setTitleColor(.black, for: .normal)

        return but
    } ()

}


class ViewController: UIViewController {
    
    let cellId = "cellid"
    let headerId = "headerId"
    var tasks: [Task] = [Task]()
    let detailsPage = DetailsViewController()
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: CGRect.zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(CustomCell.self, forCellReuseIdentifier: cellId)
        tv.register(Header.self, forHeaderFooterViewReuseIdentifier: headerId)
        tv.delegate = self
        tv.dataSource = self
        return tv
    } ()
    //var safeArea: UILayoutGuide!
    var arrayTemp = ["1", "2", "3", "4"]
    let colors: [UIColor] = [.red, .green, .blue, .brown]
    let textArray: [String] = ["1", "2", "3", "4"]
    
    

    func setUI() {
        setConstraints()
        
    }
    
    func setConstraints() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "tasks"
        //safeArea = view.layoutMarginsGuide
        hardCodeTaskArray()
        configureTableView()
        setUI()
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellid")
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func hardCodeTaskArray() {
        tasks.append(Task(title: "Task1", dueDate: Date() , location: (37.503204, 127.025543)))
        tasks.append(Task(title: "Task2", dueDate: Date() , location: (37.503204, 127.025543)))
        tasks.append(Task(title: "Task3", dueDate: Date() , location: (37.503204, 127.025543)))
    }
    @objc func handleAddButton() { //odd
        detailsPage.delegate = self
        navigationController?.pushViewController(detailsPage, animated: true)
    }
}

// MARK: - UITableDataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource, DetailsViewControllerDelegate {
 
    //these two functions are necessary
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //asks for how many rows for each section
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomCell //use ! to typecast
        let currentTask = tasks[indexPath.row]
        if indexPath.row == 0 {
            cell.textLabel?.text = "Add Button"
            cell.cellButton.addTarget(self, action: #selector(handleAddButton), for: .touchUpInside)
            return cell
        }
        cell.textLabel?.text = currentTask.title
        return cell
    }
    
    
    @objc func handleButtonClick2() { //even
        print ("2")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableCell(withIdentifier: headerId)
    }
    
    func addNewTask(_ newTask: Task) {
        tasks.append(newTask)
        for task in tasks {
            print(task.title)
        }
    }
    
    func deleteTask() {
        for task in tasks {
            //if 
        }
    }
}
