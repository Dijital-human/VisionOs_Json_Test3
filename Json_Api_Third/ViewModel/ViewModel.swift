//
//  ViewModel.swift
//  Json_Api_Third
//
//  Created by Famil Mustafayev on 20.06.24.
//

import Foundation

@MainActor class ViewModel: ObservableObject{
    
    @Published var data = [ModelData]()
    
    private var service: NetworkProtocol
    init(service: NetworkProtocol){
        self.service = service
    }
    
    func fetchData()async{
        var resource = ""
        if service.type == "WebJsonService"{
            resource = Constant.Weather.baseUrl
        }else if service.type == "LocalJsonService"{
            resource = Constant.Local.baseUrl
        }
        guard let decodeData: [ModelData] = await service.downLoadData(resource) else { return }
        
        data = decodeData
        
    }
}
