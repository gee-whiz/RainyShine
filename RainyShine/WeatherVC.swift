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
	var forecast: [Forecast] = []
	override func viewDidLoad() {
		super.viewDidLoad()

		WeatherClient.getWeatherforecast(lat: "-29.7371", long: "31.0736") {  (data) in
            self.forecast = data
			self.tableView.reloadData()
	    }



	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()

	}

	override func viewWillAppear(_ animated: Bool) {
		updateFields()
	}



	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return forecast.count
	}

	func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
		return 1
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell

		let item = forecast[indexPath.row]
        cell.imgType.image = UIImage(named: item.weatherType)
		cell.lblDay.text  = item.date
		cell.lblType.text = item.weatherType
		cell.lblMaxTemp.text = "\(item.temp_max) °"
		cell.lblMinTemp.text = "\(item.temp_min) °"

		return cell

	}

	func updateFields()  {
		WeatherClient.getCurrentWeatherDataByCity(lat: "-29.7371",long:  "31.0736") { (weather) in
			let temp  = String(format: "%0.1f", weather.currentTemp)
			self.lblCity.text = "\(weather.cityName),  \(weather.countryName)"
			self.lblTempreture.text = "\(temp ) °"
			self.lblCondition.text = weather.weatherType
			self.lblDate.text = weather.date
			self.imgMain.image  = UIImage(named: weather._weatherType)
		}
	}

}

