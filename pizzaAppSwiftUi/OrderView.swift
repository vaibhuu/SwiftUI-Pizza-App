//
//  OrderView.swift
//  pizzaAppSwiftUi
//
//  Created by Vaibhu Thakkar on 08/02/24.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var orders:OrderModel
    
    var body: some View {
        
        VStack {
            NavigationStack {
                List{
                    ForEach ($orders.orderItems) { $order in
                        NavigationLink(value: order) {
                            OrderRowView(order: $order)
                                .padding(4)
                                .padding(.bottom, 4)
                                .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))
                                .shadow(radius: 12)
                                .padding([.leading, .trailing], 7)
                        }.navigationDestination(for: OrderItem.self) { order in
                            OrderDetailView(orderItem: $order, presentSheet: .constant(false), newOrder: .constant(false), isFromOrders: true)
                        }.navigationTitle("Your Order")
                    }
                    .onDelete { indexSet in
                        orders.orderItems.remove(atOffsets: indexSet)
                    }
                    .onMove(perform: { indices, newOffset in
                        orders.orderItems.move(fromOffsets: indices, toOffset: newOffset)

                    })
                }
            }
//            .padding(.top, 70)
//            
//            Button("Delete order") {
//                if !orders.orderItems.isEmpty {
//                    orders.removeLast()
//                }
//            }
//            .padding()
//            .background(.regularMaterial, in: Capsule())
//            .padding(7)
        }
        .background(.regularMaterial)
    }
    
}


#Preview {
    OrderView(orders: OrderModel())
}
