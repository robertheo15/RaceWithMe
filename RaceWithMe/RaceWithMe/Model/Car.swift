//
//  Car.swift
//  RaceWithMe
//
//  Created by robert theo on 29/04/24.
//

import Foundation


struct Car: Identifiable {
    var id: Int
    var type : CarType
    var carNumber : String
    var name : String
    var attribute: CarAttribute
    var speedBase: Float
    var finalSpeed: Float
    
    init(id: Int, type: CarType, carNumber: String, name: String, attribute: CarAttribute, speedBase: Float, finalSpeed: Float) {
        self.id = id
        self.type = type
        self.carNumber = carNumber
        self.name = name
        self.attribute = attribute
        self.speedBase = speedBase
        self.finalSpeed = finalSpeed
    }
    static func getAssetsData() -> [Car] {
        return [
            Car(id: 1, type: CarType.sedan, carNumber: "", name: "sedan", attribute: CarAttribute(velg: "sedan_velg"), speedBase: 10, finalSpeed: 200),
            Car(id: 2, type: CarType.cooper, carNumber: "", name: "cooper", attribute: CarAttribute(velg: "cooper_velg"), speedBase: 10, finalSpeed: 100)
            
        ]
    }
    
}

enum CarType: String {
    case sedan = "car_type1"
    case cooper = "car_type2"
    case supercar = "supercar"
}

struct CarAttribute {
    var velg: String
    
    init(velg: String) {
        self.velg = velg
    }
}

