//
//  ViewController.swift
//  MoviesAppExample
//
//  Created by Murat Çimen on 21.07.2023.
//

import UIKit

class MainController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var seacrhMovie: UISearchBar!
    
    @IBOutlet weak var movieList: UITableView!
    
    var services: ServiceManager = ServiceManager()
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seacrhMovie.delegate = self
    }
    
    
    // MARK: Request
    func load(searchText: String){
        services.fetchMovies(paramaters: ["query": searchText]) { [weak self] (response) in
            switch response{
            case .success(let data):
                self?.movies = data.results
                self?.movieList.reloadData()
            case .failure(let error):
                print("Hata", error)
            }
        }
    }
    
    // MARK: Search
    // textDidchange yazınca otomatik çıkıyor
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchValue = searchText
        if searchValue.count >= 3{
            load(searchText: searchValue.lowercased())
        }else{
            self.movies = []
            movieList.reloadData()
        }
    }
}

extension MainController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count > 0 ? movies.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if movies.count == 0{
            let cell = movieList.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as! EmptyTableViewCell
            return cell
        }else{
            let cell = movieList.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
            cell.img.loadImage(url: URL(string: movies[indexPath.row].movieImage)!)
            cell.titleText.text = movies[indexPath.row].title
            cell.subTitleText.text = movies[indexPath.row].overView
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if movies.count != 0{
            let storyboard = UIStoryboard(name: "Detail", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
            let movie = movies[indexPath.row]
            vc.movie = movie
            show(vc, sender: nil)
        }
    }
}
