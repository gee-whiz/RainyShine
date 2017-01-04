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

		print(CURRENT_WEATHER_URL)

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

