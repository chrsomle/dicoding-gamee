//
//  APIResponse.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 17/08/21.
//

import Foundation

struct APIResponse: Decodable {
	let results: [Game]
}
