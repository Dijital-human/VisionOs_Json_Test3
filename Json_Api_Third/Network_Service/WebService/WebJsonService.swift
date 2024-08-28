//
//  WebService.swift
//  Json_Api_Third
//
//  Created by Famil Mustafayev on 20.06.24.
//

import Foundation

class WebJsonService: Codable, ObservableObject, NetworkProtocol{
    func downLoadData<T: Codable>(_ fromUrl: String) async -> T? {
        do{
            guard let url = URL(string: fromUrl) else { throw ErrorManager.badUrl }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse else { throw ErrorManager.badResponse }
            guard response.statusCode > 199 && response.statusCode < 300 else { throw ErrorManager.badResponse }
            guard let decodeData = try? JSONDecoder().decode(T.self, from: data) else{ throw ErrorManager.badData }
            return decodeData
        }catch ErrorManager.badUrl{
            print("Bad Url")
        }catch ErrorManager.badResponse{
            print("Bad Response")
        }catch{
            print("Bad Data")
        }
        return nil
    }
    
    var type: String = "WebJsonService"
    
    
}
