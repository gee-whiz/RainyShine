//
// WeatherVC.swift
//  CD
//
//  Created by George Kapoya on 2017/01/03.
//  Copyright © 2017 immeddia. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
	@IBOutlet weak var imgMain: UIImageView!
	@IBOutlet weak var tableView: UITableView!

	@IBOutlet weak var lblCondition: UILabel!
	@IBOutlet weak var lblCity: UILabel!
	@IBOutlet weak var lblTempreture: UILabel!
	@IBOutlet weak var lblDate: UILabel!
	override func viewDidLoad() {
		super.viewDidLoad()

		WeatherClient.getCurrentWeatherDataByCity(url: CURRENT_WEATHER_URL) { (weather) in
			 let temp  = String(format: "%0.1f", weather.currentTemp)
             self.lblCity.text = "\(weather.cityName),  \(weather.countryName)"
			 self.lblTempreture.text = "\(temp ) °"
			 self.lblCondition.text = weather.weatherType
			 self.lblDate.text = weather.date
		}

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()

	}





	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}

	func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
		return 1
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

		return cell

	}

}

