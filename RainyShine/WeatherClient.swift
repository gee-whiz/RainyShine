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
var forecast: [Forecast] = []
  var dateFromString: Date?
class  WeatherClient {
	static func getCurrentWeatherDataByCity(lat: String, long: String, completion:  @escaping (Weather)->Void) {
		let CURRENT_WEATHER_URL = "\(BASE_URL)weather?\(LATITUDE)\(lat)\(LONGITUDE)\(long)\(APPID)\(APIKEY)"
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
					   let type = item["main"] as! String
					   weather._weatherType = type
					}
				  completion(weather)
			}catch{
				print(error)
			}

		})

	}


	static func getWeatherforecast(lat: String, long: String ,completion: @escaping ([Forecast])->Void) {
		let FORECAST_WEATHER_URL = "\(BASE_URL)forecast/daily?\(LATITUDE)\(lat)\(LONGITUDE)\(long)\(APPID)\(APIKEY)"
		Alamofire.request(FORECAST_WEATHER_URL).response(completionHandler: { (response)-> Void in
			do{
				let jsonRespondObject = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! JSONStantard

				if let result = jsonRespondObject["list"] as? [JSONStantard] {
					for item  in 0..<result.count {
						let main = result[item]
						let temp = main["temp"] as! JSONStantard
						let max_temp =  String(format: "%0.1f", (temp["max"] as! Double) - 273.15 )
						let min_temp =  String(format: "%0.1f", (temp["min"] as! Double) - 273.15)
						if let date =  main["dt"] as? Double {
							let unixconverteddate = Date(timeIntervalSince1970: date)
							let dateFormatter = DateFormatter()
							dateFormatter.dateStyle = .full
							dateFormatter.dateFormat  = "EEEE"
							dateFormatter.timeStyle = .none
							let items = main["weather"] as? [JSONStantard]
							let item = items?[0]
							let type = item?["main"] as! String
                          forecast.append(Forecast(temp_max: max_temp, temp_min: min_temp, date: unixconverteddate.dayOfTheWeek(), weatherType: type))

						}


					}
				}
			 completion(forecast)

			}catch{
				print(error)
			}

		})
	}

}






