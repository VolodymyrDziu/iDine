//
//  ItemDetail.swift
//  iDine
//
//  Created by Volodymyr Dziubenko on 09.04.2025.
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    @EnvironmentObject var order: Order
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text(item.photoCredit)
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            .padding()
            
            VStack {
                Text(item.description)
                    .padding()
                
                Button("Order"){
                    order.add(item: item)
                }
                .buttonStyle(.bordered)
                Spacer()
            }
            .padding()
        }
        
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}




struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(item: MenuItem.example)
            .environmentObject(Order())
    }
}
