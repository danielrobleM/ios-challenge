//
//  WeatherViewModel.swift
//  Weatherfy
//
//  Created by Daniel Roble on 15-02-18.
//  Copyright © 2018 SoSafe. All rights reserved.
//

import Foundation
import CoreLocation

@objc class WeatherViewModel: NSObject {

	func find(city: String, completion: @escaping (CLLocation?) -> ()) {
		let geoCoder = CLGeocoder()
		geoCoder.geocodeAddressString(city) { (placemarks, error) in
			guard let placemarks = placemarks, let location = placemarks.first?.location else {
				return completion(nil)
			}
			return completion(location)
		}
	}
	
}
