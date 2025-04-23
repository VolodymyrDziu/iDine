//
//  ItemRow.swift
//  iDine
//
//  Created by Volodymyr Dziubenko on 09.04.2025.
//

import SwiftUI

struct ItemRow: View {
    let item: MenuItem
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .border(.gray)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$: \(item.price)")
            }
            
            Spacer()
            
            ForEach(item.restrictions, id: \.self){restriction in
                Text(restriction)
                    .padding(2)
                    .background(colors[restriction, default: .black])
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
