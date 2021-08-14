//
//  ImageCache.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 14/08/21.
//

import UIKit

final class ImageCache {
	var cache = NSCache<NSString, UIImage>()

	static let shared = ImageCache()

	private init() {}

	func get(forKey key: String) -> UIImage? {
		cache.object(forKey: NSString(string: key))
	}

	func set(forKey key: String?, image: UIImage?) {
		if let key = key, let image = image {
			cache.setObject(image, forKey: NSString(string: key))
		}
	}
}
