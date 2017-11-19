//
//  Gnome.swift
//  Brastlewark
//
//  Created by Miguel Mañas Alvarez on 17/11/17.
//  Copyright © 2017 Miguel Mañas. All rights reserved.
//

import Foundation
import ObjectMapper

class Gnome: Mappable {
    
    var thumbnail:String?
    var weight:Double?
    var height:Double?
    var id:Int?
    var age:Int?
    var hair_color:String?
    var professions:[String]?
    var friends:[String]?
    var name:String?
    var image:UIImage?
    
    init(image: UIImage?, weight:Double?, height:Double?, id:Int?, age:Int?, hair_color:String?, professions:[String]?, friends:[String]?, name:String?){
        self.image = image
        self.weight = weight
        self.height = height
        self.id = id
        self.age = age
        self.hair_color = hair_color
        self.professions = professions
        self.friends = friends
        self.name = name
        
    }
    
    required init?(map: Map) {
        
    }
    
    
    func mapping(map: Map) {
        
        thumbnail      <- map["thumbnail"]
        weight         <- map["weight"]
        height         <- map["height"]
        id             <- map["id"]
        age            <- map["age"]
        hair_color     <- map["hair_color"]
        professions    <- map["professions"]
        friends        <- map["friends"]
        name           <- map["name"]

    }
    
}
