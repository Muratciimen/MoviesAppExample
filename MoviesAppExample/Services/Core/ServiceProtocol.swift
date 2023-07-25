//
//  ServiceProtocol.swift
//  MoviesAppExample
//
//  Created by Murat Çimen on 21.07.2023.
//

import Foundation
import Alamofire


protocol ServiceProtocol{
    func fetchMovies(paramaters: [String: String]?, completion: @escaping((Results<MovieModel>)) ->())
}
