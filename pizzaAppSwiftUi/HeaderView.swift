//
//  HeaderView.swift
//  pizzaAppSwiftUi
//
//  Created by Vaibhu Thakkar on 08/02/24.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var orders: OrderModel
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image("surfBanner")
                    .resizable()
                    .scaledToFit()
    //                .scaledToFill()
                    .ignoresSafeArea()
                Text("Dominos Pizza Company")
                    .font(.custom("Georgia", size: 28,relativeTo: .title))
                    .foregroundStyle(.regularMaterial)
                    .fontWeight(.semibold)
            }
            Label{
                Text(orders.orderTotal, format: .currency(code: "USD"))
            }icon: {
            Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.circle.fill")
        }
        }.background(.ultraThinMaterial)
    }
}


#Preview {
    HeaderView().environmentObject(OrderModel())
}
