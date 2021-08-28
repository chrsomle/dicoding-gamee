//
//  AboutView.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 14/08/21.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.editMode) var editMode

    @AppStorage("about_app")
    var aboutApp: String = "Gamee is a platform for discovering games. Here you can find your next best game!"

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // MARK: About
            sectionHeader(title: "About")
            if let editMode = editMode, editMode.wrappedValue.isEditing {
                TextEditor(text: $aboutApp)
                    .cornerRadius(8)
                    .shadow(radius: 1)
            } else {
                Text(aboutApp)
                    .padding(.bottom)
            }

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
        .toolbar {
            EditButton()
        }
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
