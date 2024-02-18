//
//  OrderItemView.swift
//  pizzaAppSwiftUi
//
//  Created by Vaibhu Thakkar on 12/02/24.
//

import SwiftUI

struct OrderItemView: View {
    @Binding var orderItem: OrderItem
    @State private var quantity = 1
    @State private var doubleIngredient = false
    @State private var pizzaCrust: PizzaCrust
    @State private var name: String = ""
    @State private var comment: String = ""
    
    init(orderItem: Binding<OrderItem>) {
        self._orderItem = orderItem
        self.pizzaCrust = orderItem.item.crust.wrappedValue
    }
    var body: some View {
        
        VStack {
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Toggle(isOn: $doubleIngredient, label: {
                Text("Double Ingredient " + (doubleIngredient ? "Yes" : "No"))
            })
            Stepper(value: $quantity, in: 1...10) {
                Text("\(quantity) " + ((quantity == 1) ? "Pizza" : "Pizzas" ))
            }
            
            Picker(selection: $pizzaCrust) {
                ForEach(PizzaCrust.allCases, id: \.self) { crust in
                    Text(crust.rawValue)
                }
            } label: {
                Text("Pizza Crust")
            }.pickerStyle(MenuPickerStyle())
            VStack {
                Text("Comment").font(.caption).foregroundStyle(.secondary)
                TextEditor(text: $comment)
                    .clipShape(RoundedRectangle(cornerRadius: 3))
                        .shadow(radius: 1)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    OrderItemView(orderItem: .constant(testOrderItem))
}
