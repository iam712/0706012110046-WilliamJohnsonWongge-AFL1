
//  Cafe.swift
//  0706012110046-WilliamJohnsonWongge-AFL1
//
//  Created by William j. Wongge on 05/04/23.

import Foundation

protocol CafeProtocol {
    var name: String { get }
    var menus: [Menu] { get }
    var selectedMenu: Int { get set }
    
    func clearSelectedMenu()
    func showCafeScreen(cart: Cart, cafetaria: [Cafe])
    func orderScreen(cart: Cart, cafetaria: [Cafe])
}

class Cafe: CafeProtocol {
    
    var name: String = ""
    var menus: [Menu] = []
    var selectedMenu: Int = 99
    init(name: String, menus: [Menu]) {
        self.name = name
        self.menus = menus
    }
    
    func clearSelectedMenu() {
        selectedMenu = 99
    }
    
    func showCafeScreen(cart: Cart, cafetaria: [Cafe]) {
        print("")
        print("Welcome back to \(self.name)!")
        print("What would you like to order?")
        
        for (index, menu) in menus.enumerated() {
            print("[" + String(index + 1) + "] " + menu.name)
        }
        
        print("-")
        print("[B]ack to Main Menu ↩️")
        print("Your menu choice?", terminator: " ")
        
        if let menuChoice = readLine() {
            if menuChoice == "B" || menuChoice == "b" {
                mainMenuScreen(cart: cart, cafetaria: cafetaria)
            } else if let menuInt = Int(menuChoice) {
                if menuInt > 0 && menuInt <= menus.count {
                    self.selectedMenu = menuInt - 1
                    self.orderScreen(cart: cart, cafetaria: cafetaria)
                } else {
                    print("❌ There is no choice available")
                    self.showCafeScreen(cart: cart, cafetaria: cafetaria)
                }
            } else {
                print("❌ There is no choice available")
                self.showCafeScreen(cart: cart, cafetaria: cafetaria)
            }
        }
    }
    
    func orderScreen(cart: Cart, cafetaria: [Cafe]) {
        print("")
        print(menus[selectedMenu].name + " @ " + String(menus[selectedMenu].price))
        print("How many " + menus[selectedMenu].name + " you want to buy?", terminator: " ")
        
        if let quantityInput = readLine() {
            if let qtyInt = Int(quantityInput) {
                if qtyInt > 0 {
                    print("Thank you for ordering")
                    
                    var ordered: Bool = false
                    for i in 0..<cart.items.count {
                        if cart.items[i].menuName == menus[selectedMenu].name {
                            cart.items[i].addQuantity(N: qtyInt)
                            ordered = true
                            break
                        }
                    }
                    
                    if !ordered {
                        let cartItem = CartItem(
                            cafeName: name, menuName: menus[selectedMenu].name,
                            menuPrice: menus[selectedMenu].price, quantity: qtyInt)
                        cart.items.append(cartItem)
                    }
                    
                    self.clearSelectedMenu()
                    self.showCafeScreen(cart: cart, cafetaria: cafetaria)
                } else {
                    print("Please enter valid number")
                    self.orderScreen(cart: cart, cafetaria: cafetaria)
                }
            } else {
                print("Please enter valid number")
                self.orderScreen(cart: cart, cafetaria: cafetaria)
            }
        }
    }
}
