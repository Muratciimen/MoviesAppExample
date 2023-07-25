//
//  DetailViewController.swift
//  MoviesAppExample
//
//  Created by Murat Çimen on 22.07.2023
//

import UIKit

final class DetailViewController: UIViewController {

    
    @IBOutlet weak var detailImg: UIImageView!
    
    @IBOutlet weak var imdb: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var detailTitle: UILabel!
    
    @IBOutlet weak var detailOverview: UILabel!
    
    
   public var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let movie = movie{
            updateDetailMovie(movie: movie)
        }
    }
   private func updateDetailMovie(movie: Movie){
       title = movie.title
        detailImg.loadImage(url: URL(string: movie.movieImage)!)
        imdb.text = String(movie.voteAverage)
        date.text = movie.date
        detailTitle.text = movie.title
        detailOverview.text = movie.overView
    }

    
}
