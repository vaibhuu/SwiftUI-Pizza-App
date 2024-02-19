//
//  MenuView3.swift
//  HuliPizza
//
//  Created by Steven Lipton on 11/18/22.
//

import SwiftUI

struct MenuView3: View {
    var menu:[MenuItem]
    @State private var selectedItem:MenuItem? = nil
    
   
    var categoryItems:[MenuItem]{
        if selectedCategory == nil{return[]}
        let categoryMenu = menu.filter({$0.category == selectedCategory!})
            return categoryMenu
    }
    
    var body: some View {
        Text("Hello, Pizza")
    }
}

struct MenuView3_Previews: PreviewProvider {
    static var previews: some View {
        MenuView3(menu:MenuModel().menu)
    }
}
