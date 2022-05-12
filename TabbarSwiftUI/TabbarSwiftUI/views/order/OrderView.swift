//
//  OrderView.swift
//  Graphql
//
//  Created by SOTSYS303 on 26/04/22.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$Price: \(item.price)")
                        }
                    }
                }
                
                Section {
                    NavigationLink {
                        Text("Checkout page")
                    } label: {
                        Text("Make checkout")
                            .font(.headline)
                    }

                }
            }
            .navigationTitle("Order")
            .listStyle(GroupedListStyle())
//            .listStyle(InsetGroupedListStyle())
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(false)

        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
