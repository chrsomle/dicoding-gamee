//
//  AsyncImage.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 14/08/21.
//

import SwiftUI

struct AsyncImage<Placeholder: View>: View {
	@StateObject private var loader: ImageLoader
	private let placeholder: Placeholder

	init(url: URL, @ViewBuilder placeholder: () -> Placeholder) {
		self.placeholder = placeholder()
		_loader = StateObject(wrappedValue: ImageLoader(url: url))
	}

	var body: some View {
		content
			.onAppear(perform: loader.load)
	}

	private var content: some View {
		Group {
			if let image = loader.image {
				Image(uiImage: image)
					.resizable()
					.aspectRatio(contentMode: .fill)
			} else {
				placeholder
			}
		}
	}
}
