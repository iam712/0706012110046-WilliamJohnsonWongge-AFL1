//
//  main.swift
//  0706012110046-WilliamJohnsonWongge-AFL1
//
//  Created by William j. Wongge on 28/02/23.
//

import Foundation

var cafetarias: [String] = []

var tokuMenus: [(String, Int)] = []
var gotriMenus: [(String, Int)] = []
var madamLieMenus: [(String, Int)] = []
var kopteMenus: [(String, Int)] = []
// cafe, menu, harga, jumlah
var shoppingCart: [(String, String, Int, Int)] = []

func orderScreen(cafe: String, menu: String, price: Int){
    print("")
    print(menu + " @ " + String(price))
    print("How many " + menu + " you want to buy?", terminator: " ")
    
    if let quantityInput = readLine(){
        if let qtyInt = Int(quantityInput) {
            if qtyInt > 0 {
                print("Thank you for ordering")
                shoppingCart.append((String, String, Int, Int)(cafe, menu, price, qtyInt))
                //mainMenuScreen()
                if cafe == cafetarias[0]{
                    tokuScreen()
                }
                else if cafe == cafetarias[1]{
                    gotriScreen()
                }
                else if cafe == cafetarias[2]{
                    madamLieScreen()
                }
                else if cafe == cafetarias[3]{
                    kopteScreen()
                }
            }
            else {
                print("Please enter valid number")
                orderScreen(cafe: cafe, menu: menu, price: price)
            }
        }
        else {
            print("Please enter valid number")
            orderScreen(cafe: cafe, menu: menu, price: price)
        }
    }
}

func tokuScreen(){
    print("")
    print("Welcome back to Tuku-Tuku!")
    print("What would you like to order?")
    
    for (index, menu) in tokuMenus.enumerated(){
        print("[" + String(index+1) + "] " + menu.0)
    }
    
    print("-")
    print("[B]ack to Main Menu")
    print("Your menu choice?", terminator: " ")
    
    if let menuChoice = readLine(){
        if menuChoice == "B" || menuChoice == "b" {
            mainMenuScreen()
        }
        else if let menuInt = Int(menuChoice) {
            if menuInt > 0 && menuInt <= tokuMenus.count {
                orderScreen(cafe: cafetarias[0], menu: tokuMenus[menuInt-1].0, price: tokuMenus[menuInt-1].1)
            }
            else{
                print("There is no choice available")
                tokuScreen()
            }
        }
    }
}

func gotriScreen(){
    print("")
    print("Welcome back to Gotri!")
    print("What would you like to order?")
    
    for (index, menu) in gotriMenus.enumerated(){
        print("[" + String(index+1) + "] " + menu.0)
    }
    
    print("-")
    print("[B]ack to Main Menu")
    print("Your menu choice?", terminator: " ")
    
    if let menuChoice = readLine(){
        if menuChoice == "B" || menuChoice == "b" {
            mainMenuScreen()
        }
        else if let menuInt = Int(menuChoice) {
            if menuInt > 0 && menuInt <= gotriMenus.count {
                orderScreen(cafe: cafetarias[1], menu: gotriMenus[menuInt-1].0, price: gotriMenus[menuInt-1].1)
            }
            else{
                print("There is no choice available")
                gotriScreen()
            }
        }
    }
}

func madamLieScreen(){
    print("")
    print("Welcome back to Madam Lie!")
    print("What would you like to order?")
    
    for (index, menu) in madamLieMenus.enumerated(){
        print("[" + String(index+1) + "] " + menu.0)
    }
    
    print("-")
    print("[B]ack to Main Menu")
    print("Your menu choice?", terminator: " ")
    
    if let menuChoice = readLine(){
        if menuChoice == "B" || menuChoice == "b" {
            mainMenuScreen()
        }
        else if let menuInt = Int(menuChoice) {
            if menuInt > 0 && menuInt <= madamLieMenus.count {
                orderScreen(cafe: cafetarias[2], menu: madamLieMenus[menuInt-1].0, price: madamLieMenus[menuInt-1].1)
            }
            else{
                print("There is no choice available")
                madamLieScreen()
            }
        }
    }
}

func kopteScreen(){
    print("")
    print("Welcome back to Kopte!")
    print("What would you like to order?")
    
    for (index, menu) in kopteMenus.enumerated(){
        print("[" + String(index+1) + "] " + menu.0)
    }
    
    print("-")
    print("[B]ack to Main Menu")
    print("Your menu choice?", terminator: " ")
    
    if let menuChoice = readLine(){
        if menuChoice == "B" || menuChoice == "b" {
            mainMenuScreen()
        }
        else if let menuInt = Int(menuChoice) {
            if menuInt > 0 && menuInt <= kopteMenus.count {
                orderScreen(cafe: cafetarias[3], menu: kopteMenus[menuInt-1].0, price: kopteMenus[menuInt-1].1)
            }
            else{
                print("There is no choice available")
                kopteScreen()
            }
        }
    }
}

func checkoutScreen(){
    var total:Int = 0
    for item in shoppingCart {
        total += (item.2 * item.3)
    }
    
    print("")
    print("Your total order: " + String(total))
    
    while true{
        print("")
        print("Enter the amount of money:", terminator: " ")
        
        if let moneyInput = readLine(){
            // Cek tipe
            if let moneyInt = Int(moneyInput) {
                if moneyInt == 0 {
                    // uang nol
                    print("Payment can't be zero.")
                }
                else if moneyInt < 0 {
                    // negatif
                    print("Please enter a valid amount.")
                }
                else if moneyInt < total{
                    // uang kurang
                    print("Please enter a valid amount.")
                }
                else {
                    // uang cukup
                    print("Your total order: " + String(total))
                    print("You pay: " + String(moneyInt))
                    print("Change: " + String(moneyInt - total))
                    print("")
                    print("Enjoy your meals!")
                    
                    shoppingCart.removeAll()
                    break
                }
            }
            else if moneyInput.trimmingCharacters(in: .whitespaces).isEmpty {
                // input kosong
                print("Please enter your payment.")
            }
            else {
                // input random string
                print("Please enter a valid amount.")
            }
        }
    }
    mainMenuScreen()
}

func isOrderFromCafe(ind: Int)-> Bool{
    for item in shoppingCart {
        if item.0 == cafetarias[ind] {
            return true
        }
    }
    return false
}

func shoppingCartScreen(){
    print("")
    
    if shoppingCart.isEmpty {
        print("Your cart is empty.")
    }
    else{
        for i in 0..<cafetarias.count {
            if(isOrderFromCafe(ind: i)){
                print("Your order from " + cafetarias[i] + ": ")
                for item in shoppingCart {
                    if item.0 == cafetarias[i] {
                        print("- " + item.1 + " x" + String(item.3))
                    }
                }
            }
        }
    }
    
    print("")
    print("Press [B] to go back")
    !shoppingCart.isEmpty ? print("Press [P] to pay") : print("", terminator: "")
    print("Your choice?", terminator: " ")
    
    if let choice = readLine(){
        if choice == "B" || choice == "b" {
            mainMenuScreen()
        }
        else if (choice == "P" || choice == "p") && !shoppingCart.isEmpty {
            checkoutScreen()
        }
        else {
            shoppingCartScreen()
        }
    }
}

func mainMenuScreen(){
    print("")
    print("Welcome to UC-Walk Cafetaria")
    print("Please choose Cafetaria:")
    
    for (index, cafetaria) in cafetarias.enumerated(){
        print("[" + String(index+1) + "] " + cafetaria)
    }
    
    print("-")
    print("[S]hopping Cart")
    print("[Q]uit")
    print("Your Cafetaria choice?", terminator: " ")
    
    if let cafetariaChoice = readLine(){
        if cafetariaChoice == "Q" || cafetariaChoice == "q" {
            exit(0)
        }
        else if cafetariaChoice == "S" || cafetariaChoice == "s" {
            shoppingCartScreen()
        }
        else if let ccInt = Int(cafetariaChoice) {
            switch ccInt {
            case 1:
                tokuScreen()
                
            case 2:
                gotriScreen()
                
            case 3:
                madamLieScreen()
                
            case 4:
                kopteScreen()
                
            default:
                print("There is no choice available")
                mainMenuScreen()
            }
        }
        else {
            print("There is no choice available")
            mainMenuScreen()
        }
    }
}

func main(){
    // Load Cafetaria
    cafetarias.append("Tuku-tuku")
    cafetarias.append("Gotri")
    cafetarias.append("Madam Lie")
    cafetarias.append("Kopte")
    
    // Load Cafetaria Menu
    // 1. Toku-toku
    tokuMenus.append((String, Int)("Tahu Isi", 3000))
    tokuMenus.append((String, Int)("Nasi Kuning", 10000))
    tokuMenus.append((String, Int)("Nasi Tumpeng", 12000))
    tokuMenus.append((String, Int)("Air Mineral", 5000))
    
    // 2. Gotri
    gotriMenus.append((String, Int)("Nasi Bakar Rendang", 28000))
    gotriMenus.append((String, Int)("Nasi Bakar Kare", 28000))
    gotriMenus.append((String, Int)("Nasi Bakar Tuna", 28000))
    gotriMenus.append((String, Int)("Nasi Bakar Cabe Hijau", 28000))
    
    // 3. Madam Lie
    madamLieMenus.append((String, Int)("Martabak Telur", 20000))
    madamLieMenus.append((String, Int)("Martabak Mesir", 25000))
    madamLieMenus.append((String, Int)("Martabak Bangka", 30000))
    madamLieMenus.append((String, Int)("Martabak Spesial", 35000))
    
    // 4. Kopte
    kopteMenus.append((String, Int)("Kopi Tarik Kopte", 13000))
    kopteMenus.append((String, Int)("Kopi Tarik Cincau", 14000))
    kopteMenus.append((String, Int)("Kopi Teh Tarik", 15000))
    kopteMenus.append((String, Int)("Kopi Coklat Tarik", 16000))
    
    mainMenuScreen()
}

main()
