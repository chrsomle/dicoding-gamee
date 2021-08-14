//
//  AboutView.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 14/08/21.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			// MARK: About
			sectionHeader(title: "About")
			Text("Gamee is a platform for discovering games. Here you can find your next best game!")
				.padding(.bottom)

			// MARK: Developer
			sectionHeader(title: "Developer")
			HStack(spacing: 16) {
				Image("profile")
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: 64, height: 64, alignment: .center)
					.clipShape(Circle())
				VStack(alignment: .leading, spacing: 2) {
					Text("Christianto Budisaputra")
						.font(.headline)
						.bold()
					Text("iOS Developer")
						.font(.subheadline)
						.foregroundColor(.secondary)
				}
				Spacer()
			}
			.padding()
			.background(AppColor.background)
			.cornerRadius(12)
			Spacer()
		}
		.padding()
		.navigationTitle("Gamee")
    }
}

// MARK: View Builders
extension AboutView {
	@ViewBuilder func sectionHeader(title: String) -> some View {
		Text(title)
			.font(.headline)
			.bold()
			.foregroundColor(.secondary)
	}
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
		MainView()
    }
}
