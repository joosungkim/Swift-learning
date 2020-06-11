//
//  MapViewController.swift
//  ToDoList
//
//  Created by JSK on 2020/06/09.
//  Copyright © 2020 JSK. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

//37.503204
//127.025543

class MapViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 37.503204, longitude: 127.025543, zoom: 17.0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        view.addSubview(mapView)
        mapView.isMyLocationEnabled = true
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(37.503204, 127.025543)
        marker.title = "Hitit"
        marker.snippet = "HQ"
        marker.map = mapView
        
        view.addSubview(backButton)
    }
    
    let backButton: UIButton = {
        let bb = UIButton(type: .close)
        bb.translatesAutoresizingMaskIntoConstraints = false
        return bb
    } ()
    
    func backButtonHandler() {
        
    }
}
