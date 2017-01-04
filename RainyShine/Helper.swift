//
//  Helper.swift
//  RainyShine
//
//  Created by George Kapoya on 2017/01/04.
//  Copyright © 2017 immeddia. All rights reserved.
//

import UIKit

extension Date {
	func dayOfTheWeek() -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat  = "EEEE"
		return  dateFormatter.string(from: self)
	}
}
