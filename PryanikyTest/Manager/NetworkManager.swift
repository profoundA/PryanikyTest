//
//  NetworkManager.swift
//  PryanikyTest
//
//  Created by Andrey Lobanov on 27.05.2022.
//

import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func getModel(completion: @escaping (PryanikyModel) -> Void)  {
        AF.request("https://pryaniky.com/static/json/sample.json")
            .responseDecodable(of: PryanikyModel.self) { data in
                
                switch data.result {
                case .success(let data):
                    completion(data)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
