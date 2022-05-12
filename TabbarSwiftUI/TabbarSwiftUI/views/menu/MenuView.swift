//
//  MenuView.swift
//  Graphql
//
//  Created by SOTSYS303 on 24/04/22.
//

import SwiftUI

struct MenuView: View {

    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menu, id: \.id) { section in
                    Section(section.name) {
                        ForEach(section.items, id: \.id) { item in
                            NavigationLink {
                                ItemDetail(item: item)
                            } label: {
                                ItemRow(item: item)
                            }
                        }
                    }
//                    .listRowInsets(EdgeInsets())
                }
            }
            .onAppear(perform: {
                print("onAppear list")
            })
            .padding(.zero)
//                            .listStyle(PlainListStyle())
            .listStyle(GroupedListStyle())
            .listRowSeparator(.hidden)
            .navigationTitle("Menu")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
