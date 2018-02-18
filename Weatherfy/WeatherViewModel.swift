//
//  WeatherViewModel.swift
//  Weatherfy
//
//  Created by Daniel Roble on 15-02-18.
//  Copyright © 2018 SoSafe. All rights reserved.
//

import Foundation
import CoreLocation

@objc final class WeatherViewModel: NSObject {

	final let dataSource = DataSource()
	var mean:Double = -1
	var variance:Double = -1

	func find(town: String, completion: @escaping (CLLocation?) -> ()) {
		let geoCoder = CLGeocoder()
		calculate(town: town)
		geoCoder.geocodeAddressString(town) { (placemarks, error) in
			guard let placemarks = placemarks, let location = placemarks.first?.location else {
				return completion(nil)
			}
			return completion(location)
		}
	}

	func calculate(town: String) {
		let result = dataSource.calculate(in: town)
		mean = result.mean
		variance = result.variance
	}

	func getVariance() -> String {
		return variance == -1 ? "-1" : String(format:"%.1f", variance)
	}

	func getMean() -> String {
		return mean == -1 ? "-1" : String(format:"%.1f", mean)
	}
}
