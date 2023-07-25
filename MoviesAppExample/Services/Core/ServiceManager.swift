//
//  ServiceManager.swift
//  MoviesAppExample
//
//  Created by Murat Çimen on 21.07.2023.
//

import Foundation
import Alamofire


final class ServiceManager: ServiceProtocol{
    
    static let shared = ServiceManager()
    init(){}
    
    func fetchMovies(paramaters: [String : String]?, completion: @escaping ((Results<MovieModel>)) -> ()) {
        
        let url = "\(ServiceEndPoint.baseURL)?api_key=\(ServiceEndPoint.apiKey)"
        
        AF.request(url, method: .get, parameters: paramaters, headers: ServiceHelper.shared.headers).responseData { response in
            switch response.result{
            case .success(let data):
                let decoder = JSONDecoder()
                
                do{
                    let result = try decoder.decode(MovieModel.self, from: data)
                    completion(.success(result))
                }catch{
                    completion(.failure(Error.serializationError(internal: error)))
                }
                
            case .failure(let error):
                completion(.failure(Error.networkError(internal: error)))
                
            }
        }
    }
}
