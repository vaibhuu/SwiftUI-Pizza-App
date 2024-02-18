//
//  StatusBarView.swift
//  pizzaAppSwiftUi
//
//  Created by Vaibhu Thakkar on 12/02/24.
//

import SwiftUI

struct StatusBarView: View {
    @EnvironmentObject var orders: OrderModel
    @Binding var showOrders: Bool
    @Binding var presentGrid: Bool
    var body: some View {
        HStack {
            Text("\(orders.orderItems.count) Orders")
            Spacer()
            Button {
                showOrders.toggle()
            } label: {
                Image(systemName: showOrders ? "cart" : "menucard")
                
            }
            
            if !showOrders {
                Button {
                    presentGrid.toggle()
                } label: {
                    Image(systemName: presentGrid ? "square.grid.3x2" : "list.bullet")
                    
                }
            }
            
            Spacer()
            
            Label{
                Text(orders.orderTotal, format: .currency(code: "USD"))
            }icon: {
                Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.circle.fill")
            }
        }
        .foregroundColor(.white)
        .font(.title2)
    }
}

#Preview {
    StatusBarView(showOrders: .constant(false), presentGrid: .constant(false)).environmentObject(OrderModel())
}
