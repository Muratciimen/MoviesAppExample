//
//  MovieTableViewCell.swift
//  MoviesAppExample
//
//  Created by Murat Çimen on 21.07.2023.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var titleText: UILabel!
    
    @IBOutlet weak var subTitleText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
