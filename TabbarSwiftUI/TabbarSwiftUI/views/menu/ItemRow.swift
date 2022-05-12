//
//  ItemRow.swift
//  Graphql
//
//  Created by SOTSYS303 on 24/04/22.
//

import SwiftUI

struct ItemRow: View {
    let item : MenuItem
    static let colors: [String: Color] = ["D": .purple, "G": .red, "N": .black, "S": .blue, "V": .green]
    
    var body: some View {
        HStack(alignment: .top) {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.red , lineWidth: 2))
            VStack(alignment: .leading) {
                Text(item.name)
                    .foregroundColor(Color.teal)
                    .font(.headline)
                Text("$\(item.price)")
            }
            
            Spacer()
            
            ForEach(item.restrictions, id: \.self) { res in
                Text(res)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(4)
                    .background(ItemRow.colors[res, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
