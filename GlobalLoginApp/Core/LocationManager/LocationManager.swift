//
//  LocationManager.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 28.03.2024.
//

import Foundation
import CoreLocation
import SwiftUI

class LocationManager : NSObject, ObservableObject {
    
    private let locationManager = CLLocationManager()
    @Published var userLocation : CLLocationCoordinate2D?
    @Published var locationPermision : Bool? = nil
    
    static let shared = LocationManager()
    @Published var locationAccess : Bool? = nil
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    func requestLocation (){
        locationManager.requestWhenInUseAuthorization()
        print("Location Started locationAccess: \(String(describing: locationAccess))")
        
    }
    func goToSetting () {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
}
extension LocationManager: CLLocationManagerDelegate {
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userlocation:CLLocation = locations[0] as CLLocation
        
        manager.stopUpdatingLocation()
        
        let location = CLLocationCoordinate2D(latitude: userlocation.coordinate.latitude, longitude: userlocation.coordinate.longitude)
        self.userLocation = location
        
    }
    
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if #available(iOS 14.0, *) {
            switch manager.authorizationStatus {
                case .notDetermined:
                    locationPermision = false
                    print("")
                case .restricted:
                    locationPermision = false
                    print("Restricted")
                case .denied:
                    locationPermision = false
                    print("Denied")
                case .authorizedAlways:
                    locationPermision = true
                    print("Authorized Always")
                case .authorizedWhenInUse:
                    locationPermision = true
                    print("Authorized When in Use 64 satır")
                @unknown default:
                    locationPermision = false
                    print("Unknown status")
            }
            
            
            if manager.authorizationStatus == .authorizedWhenInUse ||
                manager.authorizationStatus == .authorizedAlways {
                locationAccess = true
                locationManager.startUpdatingLocation()
            }
            
            
        }
    }
}
