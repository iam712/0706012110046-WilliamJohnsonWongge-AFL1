
//Cart.swift
//0706012110046-WilliamJohnsonWongge-AFL1
//
//Created by William j. Wongge on 05/04/23.


import Foundation

class Cart {
    var items: [CartItem]
    init() {
        items = []
    }
    
    // func untuk menghitung & bayar total yang dipesan
    func checkoutScreen(cafetaria: [Cafe]) {
        // menghitung semua makanan yg dipesan di shopping cart dengan dikalikan harga dan jumlah pesanan
        var total: Int = 0
        for item in items {
            total += (item.menuPrice * item.quantity)
        }
        
        print("")
        print("Your total order: " + String(total))
        print("Press [P] to Pay 💰")
        print("Press [B] to go Back to Cart ")
        print("Your choice?", terminator: " ")
        if let tes = readLine() {
            if tes == "B" || tes == "b" {
                self.shoppingCartScreen(cafetaria: cafetaria)
            } else if tes == "P" || tes == "p" {
                while true {
                    print("")
                    print("Enter the amount of money:", terminator: " ")
                    
                    if let moneyInput = readLine() {
                        // Cek tipe
                        if let moneyInt = Int(moneyInput) {
                            if moneyInt == 0 {
                                // uang nol
                                print("Payment can't be zero.")
                            } else if moneyInt < 0 {
                                // negatif
                                print("Please enter a valid amount.")
                            } else if moneyInt < total {
                                // uang kurang
                                print("Please enter a valid amount.")
                            } else {
                                // uang cukup
                                print("Your total order: " + String(total))
                                print("You pay: " + String(moneyInt))
                                print("Change: " + String(moneyInt - total))
                                print("")
                                print("Enjoy your meals!")
                                
                                items.removeAll()
                                mainMenuScreen(cart: self, cafetaria: cafetaria)
                                break
                            }
                        } else if moneyInput.trimmingCharacters(in: .whitespaces).isEmpty {
                            // input kosong
                            print("Please enter your payment.")
                        } else {
                            // input random string
                            print("Please enter a valid amount.")
                        }
                    }
                }
            } else {
                print("❌ There is no choice available")
                self.checkoutScreen(cafetaria: cafetaria)
            }
        }
    }
    
    // untuk memastikan cafe di dalam array sama dengan cafe yang masuk di shopping cart saat user
    //memesan menu dari cafe tertentu
    func isOrderFromCafe(ind: Int, cafetaria: [Cafe]) -> Bool {
        for item in items {
            if item.cafeName == cafetaria[ind].name {
                return true
            }
        }
        return false
    }
    
    // menampilkan menu dan jumlah yang dipesan dari masing - masing cafe dari array shopping cart
    func shoppingCartScreen(cafetaria: [Cafe]) {
        print("")
        
        if self.items.isEmpty {
            print("Your cart is empty.")
        } else {
            for i in 0..<cafetaria.count {
                if self.isOrderFromCafe(ind: i, cafetaria: cafetaria) {
                    print("Your order from " + cafetaria[i].name + ": ")
                    for item in items {
                        if item.cafeName == cafetaria[i].name {
                            print("- " + item.menuName + " x" + String(item.quantity))
                        }
                    }
                }
            }
        }
        
        print("")
        print("Press [B] to go back ↩️")
        !items.isEmpty ? print("Press [P] to the Checkout Screen ") : print("", terminator: "")
        print("Your choice?", terminator: " ")
        
        if let choice = readLine() {
            if choice == "B" || choice == "b" {
                mainMenuScreen(cart: self, cafetaria: cafetaria)
            } else if (choice == "P" || choice == "p") && !items.isEmpty {
                self.checkoutScreen(cafetaria: cafetaria)
            } else {
                print("❌ There is no choice available")
                self.shoppingCartScreen(cafetaria: cafetaria)
            }
        }
    }
}
