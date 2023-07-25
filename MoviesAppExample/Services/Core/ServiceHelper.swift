//
//  ServiceHelper.swift
//  MoviesAppExample
//
//  Created by Murat Çimen on 21.07.2023.
//

import Foundation
import Alamofire

enum HTTPMethods: String{
    case get = "GET"
    case post = "POST"
}

enum Error: Swift.Error{
    case serializationError(internal: Swift.Error)
    case networkError(internal: Swift.Error)
}

struct ServiceEndPoint{
    static let baseURL: String = "https://api.themoviedb.org/3/search/movie"
    static let apiKey: String = "60b87c964abe45c9b6a0f56dc5df2e3f"
}


class ServiceHelper{
    static let shared = ServiceHelper()
    
    let headers: HTTPHeaders = [
        "Content-Type": "application/json;charset=utf-8"
    ]
}
