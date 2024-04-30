//
//  Car.swift
//  RaceWithMe
//
//  Created by robert theo on 29/04/24.
//

import Foundation


struct Car {
    var type : CarType
    var carNumber : String
    var name : String
    var attribute: CarAttribute
    var speedBase: Float
    var finalSpeed: Float
    
    init(type: CarType, carNumber: String, name: String, attribute: CarAttribute, speedBase: Float, finalSpeed: Float) {
        self.type = type
        self.carNumber = carNumber
        self.name = name
        self.attribute = attribute
        self.speedBase = speedBase
        self.finalSpeed = finalSpeed
    }
}

enum CarType {
    case sedan, suv, supercar
}

struct CarAttribute {
    var velg: String
    
    init(velg: String) {
        self.velg = velg
    }
}
