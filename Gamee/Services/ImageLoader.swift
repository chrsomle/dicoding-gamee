//
//  ImageLoader.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 14/08/21.
//

import UIKit
import Combine

class ImageLoader: ObservableObject {
	@Published var image: UIImage?
	private let url: URL
	private var cancellable: AnyCancellable?

	private let imageCache: ImageCache = .shared

	init(url: URL) {
		self.url = url
	}

	deinit {
		cancel()
	}

	func load() {
		if let image = imageCache.get(forKey: url.absoluteString) {
			self.image = image
		} else {
			cancellable = URLSession.shared.dataTaskPublisher(for: url)
				.map { UIImage(data: $0.data) }
				.replaceError(with: nil)
				.receive(on: DispatchQueue.main)
				.sink { [weak self] in
					self?.image = $0
					self?.imageCache.set(forKey: self?.url.absoluteString, image: $0)
				}
		}
	}

	func cancel() {
		cancellable?.cancel()
	}
}
