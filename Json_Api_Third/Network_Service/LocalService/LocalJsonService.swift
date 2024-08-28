//
//  LocalJsonService.swift
//  Json_Api_Third
//
//  Created by Famil Mustafayev on 20.06.24.
//

import Foundation

class LocalJsonService: Codable, NetworkProtocol{
    func downLoadData<T>(_ fromUrl: String) async -> T? where T : Decodable, T : Encodable {
        do{
//            guard let path = Bundle.main.path(forResource: fromUrl, ofType: "json") else { throw ErrorManager.badUrl }
//            let urls = URL(fileURLWithPath: path)
//            guard let datas = try? Data(contentsOf: urls) else { throw ErrorManager.badData }
//            let decode = try? JSONDecoder().decode(T.self, from: datas)
//            return decode
            
            guard let url = Bundle.main.url(forResource: fromUrl, withExtension: "json") else { throw ErrorManager.badUrl }
            guard let data = try? Data(contentsOf: url) else { throw ErrorManager.badData }
            let decodeData = try? JSONDecoder().decode(T.self, from: data)
            return decodeData
        }catch{
            print("Bad Data")
        }
        return nil
    }
    
    
    var type: String = "LocalJsonService"
    
    
}
