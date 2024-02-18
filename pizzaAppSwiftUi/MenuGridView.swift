//
//  MenuGridView.swift
//  pizzaAppSwiftUi
//
//  Created by Vaibhu Thakkar on 13/02/24.
//

import SwiftUI

struct MenuGridView: View {
    var menu:[MenuItem]
    @State private var favourites:[Int] = [-1]
    @Binding var selectedItem:MenuItem
    @Namespace var nmSpace: Namespace.ID
    let columnLayout = Array(repeating: GridItem(), count: 3)
    let columnfLayout = Array(repeating: GridItem(), count: 5)
    let rows = [
          GridItem(.fixed(50))
      ]
    
    func menu(id: Int) -> MenuItem {
        menu.first(where: {$0.id == id}) ?? noMenuItem
    }
    
    var body: some View {
        VStack {
                LazyVGrid(columns: columnfLayout, content: {
                    ForEach(favourites.sorted(), id: \.self) { item in
                        FavoriteTileView(menuItem: menu(id: item))
                            .matchedGeometryEffect(id: item, in: nmSpace)
                            .onTapGesture {
                                selectedItem = menu(id: item)
                            }
                            .onLongPressGesture {
                                if let index = favourites.firstIndex(where: {$0 == item}) {
                                    favourites.remove(at: index)
                                }
                                
                            }
                    }
                    
                })

//            Text(selectedItem.name)
            
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(menu) { menu in
                        if !favourites.contains(menu.id) {
                            MenuItemTitleView(menuItem: menu)
//                                .animation(.easeOut, value: favourites)
//                                .matchedGeometryEffect(id: menu.id, in: nmSpace)
                                .onTapGesture(count: 2) {
                                    if !favourites.contains(menu.id) {
                                        favourites.append(menu.id)
                                    }
                                }
                                .onTapGesture {
                                    selectedItem = menu
                                }
                                .onLongPressGesture {
                                    selectedItem = noMenuItem
                                    
                                }
                        }
                    }
                }
            }
        }
        .animation(.easeInOut(duration: 0.5), value: favourites)

    }
}

#Preview {
    MenuGridView(menu: MenuModel().menu, selectedItem: .constant(noMenuItem))
}
