//
//  CartItem.swift
//  0706012110046-WilliamJohnsonWongge-AFL1
//
//  Created by William j. Wongge on 06/04/23.
//

import Foundation

struct CartItem {
    let cafeName: String
    let menuName: String
    let menuPrice: Int
    var quantity: Int
    
    mutating func addQuantity(N: Int){
        self.quantity += N
    }
}
