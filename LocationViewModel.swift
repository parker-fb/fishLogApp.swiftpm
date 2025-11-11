//
//  File.swift
//  fishLogApp
//
//  Created by PARKER LETAK on 11/11/25.
//

import Foundation
import CoreLocation
import Combine

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    @Published var locString = "Unkown"
    
    
    let manager = CLLocationManager()
    
    
    override init(){
        super.init()
        
        //to update things
        manager.delegate = self
        //to ask user for permis
        manager.requestWhenInUseAuthorization()
        //update location
        manager.startUpdatingLocation()
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            let geocoder = CLGeocoder()
            //using coordinates to find a place
            //placemarks is an array of addresses and places
            //error makes sure if you dont have internet or the place your at doesnt exist
            geocoder.reverseGeocodeLocation(location){ placemarks, error in
                //placemarks.first has the best match for your location
                if let placemarks = placemarks?.first{
                    let town = placemarks.locality ?? ""
                    let lake = placemarks.subLocality ?? ""
                    let state = placemarks.administrativeArea ?? ""
                    
                    self.locString = "\(lake.isEmpty ? town: lake), \(state)"
                    
                }
                
            }
        }
    }
    
    
}
