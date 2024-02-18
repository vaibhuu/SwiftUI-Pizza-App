//
//  MenuItemTitleView.swift
//  pizzaAppSwiftUi
//
//  Created by Vaibhu Thakkar on 12/02/24.
//

import SwiftUI

struct MenuItemTitleView: View {
    var menuItem: MenuItem
    var body: some View {
        VStack {
            Group {
                if let image = UIImage(named: "\(menuItem.id)_sm") {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                } else {
                    Image("surfboard_sm")
                }
                Text(menuItem.name)
                    .font(.caption2)
                    .padding(3)
            }
            .background(Color("Cyan").opacity(0.5))
            .background(.regularMaterial)
            .shadow(radius: 10)
            .shadow(radius: 3, x: 2, y: 2)
        }
    }
}

#Preview {
    MenuItemTitleView(menuItem: testMenuItem)
}
