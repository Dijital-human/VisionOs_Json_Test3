//
//  ModelData.swift
//  Json_Api_Third
//
//  Created by Famil Mustafayev on 20.06.24.
//

import Foundation

class ModelData: Identifiable, Codable{
    let albumId:        Int
    let id:             Int
    let title:          String
    let url:            String
    let thumbnailUrl:   String
}
//"albumId": 1,
//"id": 1,
//"title": "accusamus beatae ad facilis cum similique qui sunt",
//"url": "https://via.placeholder.com/600/92c952",
//"thumbnailUrl": "https://via.placeholder.com/150/92c952"
