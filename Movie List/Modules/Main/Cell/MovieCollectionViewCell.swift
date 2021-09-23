//
//  MovieCollectionViewCell.swift
//  Movie List
//
//  Created by Fikri Ihsan on 22/09/21.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mIvPoster: UIImageView!
    @IBOutlet weak var mLblRating: UILabel!
    @IBOutlet weak var mLblDate: UILabel!
    @IBOutlet weak var mLblTitle: UILabel!
    
    func setup(data : MovieListData){
        let url = URL(string: "https://image.tmdb.org/t/p/w185" + data.backdrop_path!)
        mIvPoster.kf.setImage(with: url)
        mLblRating.text = String(data.vote_average!)
        mLblDate.text = data.release_date
        mLblTitle.text = data.title
    }
}
