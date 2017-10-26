//
//  ProfessionalsController-CLLocationManager.swift
//  iShoddy
//
//  Created by Jose Sanchez Rodriguez on 2/10/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation
import CoreLocation

extension ProfessionalsController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager?.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            gps_lat = location.coordinate.latitude
            gps_lon = location.coordinate.longitude
        }
    }
}
