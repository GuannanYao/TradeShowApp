//
//  MapViewController.swift
//  TradeShow
//
//  Created by Guannan Yao on 16/09/2015.
//  Copyright (c) 2015 University of Wollongong. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var viewMap: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layoutIfNeeded()
        var camera = GMSCameraPosition.cameraWithLatitude(-34.4062, longitude: 150.8795, zoom: 18)
        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        self.view = mapView
        mapView.myLocationEnabled = true
        
        var position = CLLocationCoordinate2DMake(-34.4062, 150.8795)
        var marker = GMSMarker(position: position)
        marker.title = "Hello World"
        marker.map = mapView
        marker.opacity = 0.6
        
        if self.revealViewController() != nil{
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
