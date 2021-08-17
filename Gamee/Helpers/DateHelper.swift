//
//  DateHelper.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 17/08/21.
//

import Foundation

struct DateHelper {
	private let inputFormat = DateFormatter()
	private let outputFormat = DateFormatter()

	init(inputFormat: String, outputFormat: String) {
		self.inputFormat.dateFormat = inputFormat
		self.outputFormat.dateFormat = outputFormat
	}

	func convert(date: String) -> String {
		if let result = inputFormat.date(from: date) {
			return outputFormat.string(from: result)
		}

		return date
	}
}
