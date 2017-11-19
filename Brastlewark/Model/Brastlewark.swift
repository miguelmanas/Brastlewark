//
//  Brastlewark.swift
//  Brastlewark
//
//  Created by Miguel Mañas Alvarez on 17/11/17.
//  Copyright © 2017 Miguel Mañas. All rights reserved.
//

import Foundation
import ObjectMapper

class Brastlewark: Mappable {
    
    var arrayGnomes:[Gnome]?
    
    init(arrayGnomes:[Gnome]?){
        self.arrayGnomes = arrayGnomes
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        arrayGnomes    <- map["Brastlewark"]
    }
    
    func averageAge()->Float?{
        var averageAge:Float = 0
        var countAge:Float = 0
        guard let arrayGnome = self.arrayGnomes else {return 0.0}
        for gnome in arrayGnome {
            if let age = gnome.age {
                averageAge = averageAge + Float(age)
                countAge += 1
            }
        }
        return averageAge / countAge
    }
    
    func averageHeight()->Float?{
        var averageHeight:Float = 0
        var countHeight:Float = 0
        guard let arrayGnome = self.arrayGnomes else {return 0.0}
        for gnome in arrayGnome {
            if let height = gnome.height {
                averageHeight = averageHeight + Float(height)
                countHeight += 1
            }
        }
        return averageHeight / countHeight
    }
    
    func averageWeight()->Float?{
        var averageWeight:Float = 0
        var countWeight:Float = 0
        guard let arrayGnome = self.arrayGnomes else {return 0.0}
        for gnome in arrayGnome {
            if let weight = gnome.weight {
                averageWeight = averageWeight + Float(weight)
                countWeight += 1
            }
        }
        return averageWeight / countWeight
    }
    
    func countHairColor()->[String:Int]?{
        var countHairColor:[String:Int] = [String:Int]()
        guard let arrayGnome = self.arrayGnomes else {return [String:Int]()}
        for gnome in arrayGnome {
            if let hair_color = gnome.hair_color {
                if countHairColor.keys.contains(hair_color) {
                    countHairColor[hair_color] = countHairColor[hair_color]! + 1
                } else {
                    countHairColor[hair_color] = 1
                }
            }
        }
        return countHairColor
    }
    
    
    
}
