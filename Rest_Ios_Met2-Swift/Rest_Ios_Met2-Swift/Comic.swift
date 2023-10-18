//
//  Comic.swift
//  Exemplo1_Json
//
//  Created by Usuário Convidado on 04/10/23.
//

import Foundation

struct Comic:Decodable{
    var num:Int
    var day:String
    var month:String
    var year:String
    var title:String
    var img:String
}
