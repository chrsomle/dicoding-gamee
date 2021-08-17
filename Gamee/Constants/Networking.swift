//
//  Networking.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 15/08/21.
//

import Foundation

struct Networking {
	static var apiKey: String {
		get {
			guard let filePath = Bundle.main.path(forResource: "rawg.io-Info", ofType: "plist") else {
				fatalError("Couldn't find file 'rawg.io-Info.plist'.")
			}

			let plist = NSDictionary(contentsOfFile: filePath)

			guard let value = plist?.object(forKey: "API_KEY") as? String else {
				fatalError("Couldn't find key 'API_KEY' in 'rawg.io-Info.plist'.")
			}

			return value
		}
	}
}
