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
class  WeatherClient {


	static func getCurrentWeatherDataByCity(url: String, completion:  @escaping (Weather)->Void) {

		Alamofire.request(url).response(completionHandler: { (response)-> Void in
			do{

             let jsonRespondObject = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! JSONStantard

				print(jsonRespondObject)

			}catch{
				print(error)
			}

		})


	}











}
