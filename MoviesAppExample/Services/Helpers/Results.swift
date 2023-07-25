//
//  Results.swift
//  MoviesAppExample
//
//  Created by Murat Çimen on 21.07.2023.
//

import Foundation


enum Results<Value>{
    case success(Value)
    case failure(Error)
}
