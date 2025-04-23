//
//  OrderView.swift
//  iDine
//
//  Created by Volodymyr Dziubenko on 10.04.2025.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.items){item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$: \(item.price)")
                        }
                    }
                    .onDelete(perform: deleteItem)
                }
                Section {
                    NavigationLink("Order price"){
                        CheckoutView()
                    }
                }
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("Order")
            .toolbar {
                EditButton()
            }
        }
      
    }
    
    func deleteItem(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
