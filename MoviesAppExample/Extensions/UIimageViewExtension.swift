//
//  UIimageViewExtension.swift
//  MoviesAppExample
//
//  Created by Murat Çimen on 21.07.2023.
//

import Foundation
import UIKit

extension UIImageView{

    func loadImage(url: URL){

        DispatchQueue.global().async {

            if let data = try? Data(contentsOf: url){

                if let image = UIImage(data: data){

                    DispatchQueue.main.async {

                        self.image = image

                    }

                }

            }

        }

    }

}
