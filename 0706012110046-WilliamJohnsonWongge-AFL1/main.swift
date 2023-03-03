//
//  main.swift
//  0706012110046-WilliamJohnsonWongge-AFL1
//
//  Created by William j. Wongge on 28/02/23.
//

import Foundation

var cafetariaInput : String = ""
var menuInput : String = ""
var menuPrice : Int
var orderAmount : Int
var subTotal : Int
var total : Int
var pay : Int
var cek : Bool = true
var cek1 : Bool = true

while cek == true{
    print("Welcome to UC-Walk Cafeteria 👨🏻‍🍳👩🏻‍🍳\nPlease choose Cafeteria:\n\n[1] Tuku-Tuku\n[2] Gotri\n[3] Madam Lie\n[4] Kopte\n-\n[S]hopping Cart\n[Q]uit\nYour Cafeteria choice?")
        cafetariaInput = readLine()!
    
            if(cafetariaInput == "1"){
            print("Welcome back to Tuku - Tuku !\nWhat would you like to order\n[1] Tahu isi\n[2] Nasi kuning\n[3] Nasi campur\n[3] Air mineral\n-\n[B]ack to Main Menu\nYour menu choice?")
                menuInput = readLine()!
                while cek1 == true {
                    if menuInput == "b"{
                        cek1 = false
                        break
                    }
                    else {
                        print("tes")
                    }
                }
            }
            
            else if(cafetariaInput == "2"){
                print("Welcome back to Gotri !\nWhat would you like to order\n[1] Nasi bakar\n[2] Nasi goreng\n[3] Mie goreng\n[3] Es telerl\n-\n[B]ack to Main Menu\nYour menu choice?")
                menuInput = readLine()!
                while cek1 == true {
                    if menuInput == "b"{
                        cek1 = false
                        break
                    }
                    else {
                        print("tes")
                    }
                }
            }
            else if(cafetariaInput == "3"){
                print("Welcome back to Madam Lie !\nWhat would you like to order\n[1] Tahu isi\n[2] Nasi kuning\n[3] Nasi campur\n[3] Air mineral\n-\n[B]ack to Main Menu\nYour menu choice?")
                menuInput = readLine()!
                while cek1 == true {
                    if menuInput == "b"{
                        cek1 = false
                        break
                    }
                    else {
                        print("tes")
                    }
                }
            }
            else if(cafetariaInput == "4"){
                print("Welcome back to Kopte  !\nWhat would you like to order\n[1] Tahu isi\n[2] Nasi kuning\n[3] Nasi campur\n[3] Air mineral\n-\n[B]ack to Main Menu\nYour menu choice?")
                menuInput = readLine()!
                while cek1 == true {
                    if menuInput == "b"{
                        cek1 = false
                        break
                    }
                    else {
                        print("tes")
                    }
                }
            }
            else if (cafetariaInput == "q"){
                cek = false
                exit(0)
            }
            

    
}



