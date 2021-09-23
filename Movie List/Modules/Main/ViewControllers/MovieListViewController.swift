//
//  MovieListViewController.swift
//  Movie List
//
//  Created by Fikri Ihsan on 22/09/21.
//

import UIKit

class MovieListViewController: UIViewController {

    var viewModel : MovieListViewModel!
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getMovieList()
        bindViewModelData()
        mCollectionView.dataSource = self
        mCollectionView.delegate = self
        
    }
    
    func bindViewModelData(){
        self.viewModel.bindVMToController = {
            self.mCollectionView.reloadData()
            print("reload")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = viewModel.genreItem.name
        navigationController?.navigationBar.isHidden = false
    }
   

}

extension MovieListViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieListCell", for: indexPath) as! MovieCollectionViewCell
        cell.setup(data: viewModel.movieList[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel.movieList.count - 1 {  //numberofitem count
            viewModel.loadMoreMovie()
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = viewModel.movieList[indexPath.row]
        viewModel.goToMovieDetail(movie_id: data.id!)
    }
    
    
}
