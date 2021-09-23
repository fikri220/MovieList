//
//  MovieDescpViewController.swift
//  Movie List
//
//  Created by Fikri Ihsan on 21/09/21.
//

import UIKit
import Kingfisher

class MovieDescpViewController: UIViewController {

    var viewModel : MovieDescpViewModel!
    
    @IBOutlet weak var mLblTitle: UILabel!
    @IBOutlet weak var mLblRunTime: UILabel!
    @IBOutlet weak var mLblVote: UILabel!
    @IBOutlet weak var mLblOverview: UILabel!
    @IBOutlet weak var mIvPoster: UIImageView!
    @IBOutlet weak var mWebView: UIWebView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.getMovieDescp()
        bindViewModelData()
    }
    
    @IBAction func onClickedReviewBtn(_ sender: Any) {
        viewModel.goToUserReview()
    }
    
    
    func bindViewModelData(){
        self.viewModel.bindVMToController = {
            self.setupUI(data: self.viewModel.moviesDescpData)
        }
        
        self.viewModel.bindVMToControllerTrailer = {
            self.setupTrailer()
        }
    }
    
    func setupTrailer(){
        if viewModel.trailerKey != "" {
            let urlVid = URL(string: "https://www.youtube.com/embed/\(viewModel.trailerKey)")!
            mWebView.loadRequest(URLRequest(url: urlVid))
        }
    }
    
    func setupUI(data : MovieDescpResultData){
        mLblTitle.text = data.title
        mLblRunTime.text = data.release_date
        mLblVote.text = String(data.vote_average!)
        mLblOverview.text = data.overview
        
        let url = URL(string: "https://image.tmdb.org/t/p/w185" + data.backdrop_path!)
        mIvPoster.kf.setImage(with: url)
        
        
        
    }
   

}
