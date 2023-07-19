//
//  Musicians.swift
//  MusicianClass
//
//  Created by Enzo Manzo Carelli on 06/07/23.
//

import Foundation

enum MusicianType {
    case LeadGuitar
    case Vocalist
    case Drummer
    case Bassist
    case Violenist
}

class Musicians {
    
    //Atributes
    var name : String
    var age : Int
    var instrument : String
    var type : MusicianType
    
    //constructor - initializer
    init(name: String, age: Int, instrument: String, type: MusicianType) {
        self.name = name
        self.age = age
        self.instrument = instrument
        self.type = type
    }
    
    func sing(){
        print("nothing else matters...")
    }
    
    private func test () {
        print("test")
        
    }
}
