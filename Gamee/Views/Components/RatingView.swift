//
//  RatingView.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 15/08/21.
//

import SwiftUI

struct RatingView: View {

	private let fullCount: Int
	private let emptyCount: Int
	private let halfFullCount: Int

	init(rating: Double, ratingTop: Int) {
		let ratio = rating / Double(ratingTop) * 5
		fullCount = Int(ratio)
		emptyCount = Int(5.0 - ratio)
		halfFullCount = (fullCount + emptyCount) < 5 ? 1 : 0
	}

    var body: some View {
		HStack(spacing: 2) {
			ForEach(0..<fullCount) { _ in
				Image(systemName: "star.fill")
			}
			ForEach(0..<halfFullCount) { _ in
				Image(systemName: "star.leadinghalf.fill")
			}
			ForEach(0..<emptyCount) { _ in
				Image(systemName: "star")
			}
		}
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
		RatingView(rating: 4.5, ratingTop: 5)
    }
}
