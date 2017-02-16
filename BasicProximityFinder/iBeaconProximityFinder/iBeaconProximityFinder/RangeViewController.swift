//
//  ViewController.swift
//  iBeaconProximityFinder
//
//  Created by David Richardson on 2/16/17.
//  Copyright © 2017 DTSE Swift Coders. All rights reserved.
//

import UIKit
import CoreLocation

class RangeViewController: UIViewController, CLLocationManagerDelegate {
    var uuid = String()
    var major = Int()
    var minor = Int()
    var identifier = String()
    let locationManeger = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManeger.delegate = self
        locationManeger.requestAlwaysAuthorization()
        
    }
    func rangeBeacons () {
        let region = CLBeaconRegion(proximityUUID: UUID(uuidString: uuid)!, major: CLBeaconMajorValue(major), minor: CLBeaconMinorValue(minor), identifier: identifier)
        locationManeger.startRangingBeacons(in: region)
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            rangeBeacons()
        }
    }
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        guard let discoveredBeacon = beacons.first?.proximity
            else {
             print("errrrr")
             return
        }
        var backgroundColor = UIColor()
        
        switch discoveredBeacon {
        case .immediate:
            backgroundColor = UIColor.green
            break
        case .near:
            backgroundColor = UIColor.yellow
            break
        case .far:
            backgroundColor = UIColor.red
            break
        default:
            backgroundColor = UIColor.gray
            break
        }
        
        view.backgroundColor = backgroundColor
    }
}

