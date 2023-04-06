
//  Menu.swift
//  0706012110046-WilliamJohnsonWongge-AFL1
//
//  Created by William j. Wongge on 05/04/23.

struct Menu {
    let name: String
    let price: Int
    
    func getMenuXQuantityPrice(N: Int) -> Int {
        return (price * N)
    }
}
