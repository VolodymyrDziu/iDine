//
//  CheckoutView.swift
//  iDine
//
//  Created by Volodymyr Dziubenko on 11.04.2025.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    var paymentTypes = ["Cash","Credit card","point"]
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    let tipAmounts = [10, 15, 20, 25, 0]
    @State private var tipAmount = 15
    @State private var showingPaymentAlert = false
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay",selection: $paymentType){
                    ForEach(paymentTypes, id:\.self){
                        Text($0)
                    }
                }
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }
            Section("Add a tip"){
                Picker("Percentage",selection: $tipAmount){
                    ForEach(tipAmounts, id: \.self){
                        Text("\($0) %")
                    }
                }
                .pickerStyle(.segmented)
            }
            Section("Total: \(totalPrice)"){
                Button("Confirm order"){
                    showingPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("checkout")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order confirm", isPresented: $showingPaymentAlert){
            //code
        }message: {
            Text("Your total:\(totalPrice) Thank you!")
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
