//
//  ContentView.swift
//  pizzaAppSwiftUi
//
//  Created by Vaibhu Thakkar on 08/02/24.
//

import SwiftUI
//todo :- See all System Environment values available, Check and Play around all modifiers
struct ContentView: View {
    var menu:[MenuItem]
    @StateObject var orders:OrderModel = OrderModel()
    @State private var selectedItem: MenuItem = noMenuItem
    @State private var showOrders:Bool = false
    @State private var presentGrid: Bool = false
    
    var body: some View {
        TabView {
            
            VStack {
                HeaderView()
                    .shadow(radius: 5)
                    .environment(\.colorScheme, .light)
                StatusBarView(showOrders: $showOrders, presentGrid: $presentGrid)
//                MenuItemView(item: $selectedItem, orders: orders)
//                    .padding(5)
//                    .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
//                if presentGrid {
//                    MenuGridView(menu: menu, selectedItem: $selectedItem)
//                } else {
//                    MenuView(menu: menu, selectedItem: $selectedItem)
//                }
                MenuView2(menu: menu)
            }.tabItem {
                Label("Menu", systemImage: "list.bullet")
            }
            
            VStack {
                HeaderView()
                    .shadow(radius: 5)
                    .environment(\.colorScheme, .light)
                StatusBarView(showOrders: $showOrders, presentGrid: $presentGrid)
                //            if showOrders
                //            {
                OrderView(orders: orders)
                    .cornerRadius(12)
            } .tabItem {
                Label("Order", systemImage: "cart")
            }
        }
        .padding()
        .background(.linearGradient(colors: [.cyan, Color("Surf"), Color("Sky"), .white], startPoint: .topLeading, endPoint: .bottom))
        .environmentObject(orders)
    }
}

#Preview {
    ContentView(menu: MenuModel().menu, orders: OrderModel())
}




