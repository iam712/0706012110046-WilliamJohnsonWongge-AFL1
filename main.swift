//
//  Main.swift
//  0706012110046-WilliamJohnsonWongge-AFL1
//
//  Created by William j. Wongge on 05/04/23.
//

import Foundation

func mainMenuScreen(cart: Cart, cafetaria: [Cafe]) {
    print("")
    print("Welcome to UC-Walk Cafetaria 👨🏿‍🍳👩🏿‍🍳")
    print("Please choose Cafetaria:")
    
    // print cafe yang tersedia di dalam array
    for (index, cafe) in cafetaria.enumerated() {
        print("[" + String(index + 1) + "] " + cafe.name)
    }
    
    print("-")
    print("[S]hopping Cart 🛒")
    print("[Q]uit ")
    print("Your Cafetaria choice?", terminator: " ")
    
    if let cafetariaChoice = readLine() {
        // tombol q untuk keluar dari program
        if cafetariaChoice == "Q" || cafetariaChoice == "q" {
            exit(0)
        }
        // tombol s untuk masuk ke shopping cart
        else if cafetariaChoice == "S" || cafetariaChoice == "s" {
            cart.shoppingCartScreen(cafetaria: cafetaria)
        }
        // pencet setiap nomor untuk masuk ke masing" cafe
        else if let ccInt = Int(cafetariaChoice) {
            if ccInt <= cafetaria.count {
                cafetaria[ccInt-1].showCafeScreen(cart: cart, cafetaria: cafetaria)
                
            } else {
                print("❌ There is no choice available")
                mainMenuScreen(cart: cart, cafetaria: cafetaria)
            }
            
        } else {
            print("❌ There is no choice available")
            mainMenuScreen(cart: cart, cafetaria: cafetaria)
        }
    }
}

func main() {
    // Shopping cart
    let cart: Cart = Cart()
    
    // list cafe yang ditambahkan user
    var cafetaria: [Cafe] = []
    
    // 1. Tuku-tuku
    var tokuMenus: [Menu] = []
    // menambahkan menu & harganya ke dalam array masing" cafe
    tokuMenus.append(Menu(name: "Tahu Isi", price: 3000))
    tokuMenus.append(Menu(name: "Nasi Kuning", price: 10000))
    tokuMenus.append(Menu(name: "Nasi Tumpeng", price: 12000))
    tokuMenus.append(Menu(name: "Air Mineral", price: 5000))
    // menambahkan cafe ke dalam array cafetaria
    cafetaria.append(Cafe(name: "Tuku-tuku", menus: tokuMenus))
    
    // 2. Gotri
    var gotriMenus: [Menu] = []
    // menambahkan menu & harganya ke dalam array masing" cafe
    gotriMenus.append(Menu(name: "Nasi Bakar Rendang", price: 28000))
    gotriMenus.append(Menu(name: "Nasi Bakar Kare", price: 28000))
    gotriMenus.append(Menu(name: "Nasi Bakar Tuna", price: 28000))
    gotriMenus.append(Menu(name: "Nasi Bakar Cabe Hijau", price: 28000))
    // menambahkan cafe ke dalam array cafetaria
    cafetaria.append(Cafe(name: "Gotri", menus: gotriMenus))
    
    // 3. Madam Lie
    var madamLieMenus: [Menu] = []
    // menambahkan menu & harganya ke dalam array masing" cafe
    madamLieMenus.append(Menu(name: "Martabak Telur", price: 20000))
    madamLieMenus.append(Menu(name: "Martabak Mesir", price: 25000))
    madamLieMenus.append(Menu(name: "Martabak Bangka", price: 30000))
    madamLieMenus.append(Menu(name: "Martabak Spesial", price: 35000))
    // menambahkan cafe ke dalam array cafetaria
    cafetaria.append(Cafe(name: "Madam Lie", menus: madamLieMenus))
    
    // 4. Kopte
    var kopteMenus: [Menu] = []
    // menambahkan menu & harganya ke dalam array masing" cafe
    kopteMenus.append(Menu(name: "Kopi Tarik Kopte", price: 13000))
    kopteMenus.append(Menu(name: "Kopi Tarik Cincau", price: 14000))
    kopteMenus.append(Menu(name: "Kopi Teh Tarik", price: 15000))
    kopteMenus.append(Menu(name: "Kopi Coklat Tarik", price: 16000))
    // menambahkan cafe ke dalam array cafetaria
    cafetaria.append(Cafe(name: "Kopte", menus: kopteMenus))
    
    // 5. Raburi
    var raburiMenus: [Menu] = []
    // menambahkan menu & harganya ke dalam array masing" cafe
    raburiMenus.append(Menu(name: "Curry", price: 35000))
    raburiMenus.append(Menu(name: "Ramen", price: 45000))
    raburiMenus.append(Menu(name: "Katsu", price: 30000))
    raburiMenus.append(Menu(name: "Wintermelon Tea", price: 25000))
    // menambahkan cafe ke dalam array cafetaria
    cafetaria.append(Cafe(name: "Raburi", menus: raburiMenus))
    
    mainMenuScreen(cart: cart, cafetaria: cafetaria)
}

main()
