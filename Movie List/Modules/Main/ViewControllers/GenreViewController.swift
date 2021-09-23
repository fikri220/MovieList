//
//  GenreViewController.swift
//  Movie List
//
//  Created by Fikri Ihsan on 21/09/21.
//

import UIKit

class GenreViewController: UIViewController {
    
    var viewModel : GenreViewModel!
    var genreList : [GenreData] = []

    @IBOutlet weak var mTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getGenreList()
        bindViewModelData()
        mTableView.dataSource = self
        mTableView.delegate = self
    }
    
    func bindViewModelData(){
        self.viewModel.bindVMToController = {
            self.mTableView.reloadData()
        }
    }

}

extension GenreViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.genreList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data  = viewModel.genreList[indexPath.row]
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = data.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewModel.genreList[indexPath.row]
        //self.dismiss(animated: false)
        let genreItem = GenreItem(name: data.name, id: data.id)
        viewModel.goToMovieList(genreItem: genreItem)
    }
    
    
}
