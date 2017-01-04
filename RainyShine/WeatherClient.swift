//
//  WeatherClient.swift
//  RainyShine
//
//  Created by George Kapoya on 2017/01/04.
//  Copyright © 2017 immeddia. All rights reserved.
//

import Foundation
import Alamofire



typealias JSONStantard = [String: AnyObject]
var weather = Weather()

class  WeatherClient {
	static func getCurrentWeatherDataByCity(url: String, completion:  @escaping (Weather)->Void) {
		 Alamofire.request(CURRENT_WEATHER_URL).response(completionHandler: { (response)-> Void in
			  do{
				 let jsonRespondObject = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! JSONStantard

					if let name = jsonRespondObject["name"] as? String {
					   weather._cityName = name
					}
					if let sys = jsonRespondObject["sys"] as? JSONStantard {
					   let country = sys["country"] as! String
					   weather._countryName = country
					}
					if let main = jsonRespondObject["main"] as? JSONStantard {
					   let temp = main["temp"] as! Double
					   weather._currentTemp  = temp - 273.15
					}
					if let items = jsonRespondObject["weather"] as? [JSONStantard] {
					   let item = items[0]
					   let type = item["description"] as! String
					   weather._weatherType = type
					}
				  completion(weather)
			}catch{
				print(error)
			}

		})

	}

}
