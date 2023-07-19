//
//  SuperMusician.swift
//  MusicianClass
//
//  Created by Enzo Manzo Carelli on 06/07/23.
//

import Foundation

class SuperMusician : Musicians{
    
    func sing2(){
        print("Enter NIGHT.")
    }
    
    override func sing(){
        super.sing()
        print("exit light")
    }
    
}
