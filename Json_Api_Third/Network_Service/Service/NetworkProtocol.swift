//
//  NetworkProtocol.swift
//  Json_Api_Third
//
//  Created by Famil Mustafayev on 20.06.24.
//

import Foundation

protocol NetworkProtocol{
    func downLoadData < T: Codable > (_ fromUrl: String)async -> T?
    var type: String { get }
}
