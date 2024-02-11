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
            ZStack(alignment: .top) {
                

                ScrollView {
                    ForEach($orders.orderItems) { order in
                        OrderRowView(order: order)
//                        Text(order.item.name)
                            .padding(4)
                            .padding(.bottom, 4)
                            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))
                            .shadow(radius: 12)
                            .padding([.leading, .trailing], 7)
                    }
                }.padding(.top, 75)
                
                HStack {
                    
                    Text("Order Pizza")
                        .font(.title)
                    Spacer()
                   
                }
                .padding()
                .background(.ultraThinMaterial)
            }
            .padding()
       
            Button("Delete order") {
                if !orders.orderItems.isEmpty {
                    orders.removeLast()
                }
            }
            .padding()
            .background(.regularMaterial, in: Capsule())
            .padding(7)
        }
        .background(Color("Surf"))
    }
    
}


#Preview {
    OrderView(orders: OrderModel())
}
