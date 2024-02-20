//
//  OrderRowView.swift
//  pizzaAppSwiftUi
//
//  Created by Vaibhu Thakkar on 08/02/24.
//

import SwiftUI

struct OrderRowView: View {
    @Binding var order: OrderItem
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(order.item.name)
                Text(" | ")
                Text(order.item.crust.rawValue)
                if order.extraIngredients {
                    Text(" | ")
                    Image(systemName: "2.circle")
                }
                Spacer()
                Text(order.name)
            }
            HStack(alignment: .bottom) {
                Text(order.quantity, format: .number)
                Text(order.item.price, format: .currency(code: "USD"))
                Spacer()
                
                Text(order.extPrice, format: .currency(code: "USD"))
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    OrderRowView(order: .constant(testOrderItem))
}
