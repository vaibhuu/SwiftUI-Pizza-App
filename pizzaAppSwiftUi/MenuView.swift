//
//  MenuView.swift
//  pizzaAppSwiftUi
//
//  Created by Vaibhu Thakkar on 08/02/24.
//

import SwiftUI

struct MenuView: View {
    @Binding var selectedItem: MenuItem
    var menu:[MenuItem]
    var body: some View {
        List(MenuCategory.allCases, id:\.self) { category in
            Section {
                ForEach(menu.filter({$0.category == category})) {item in
                    MenuRowView(item: item)
                        .onTapGesture {
                            selectedItem = item
                        }
                }
            } header: {
                Text(category.rawValue)
            }
        }
    }
}

#Preview {
    MenuView(selectedItem: .constant(testMenuItem), menu: MenuModel().menu)
}
