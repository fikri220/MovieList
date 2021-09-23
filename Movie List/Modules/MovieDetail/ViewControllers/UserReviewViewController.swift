//
//  UserReviewViewController.swift
//  Movie List
//
//  Created by Fikri Ihsan on 22/09/21.
//

import UIKit

class UserReviewViewController: UIViewController {

    var viewModel : UserReviewViewModel!
    @IBOutlet weak var mTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bindViewModelData()
        viewModel.getUserReview()
        mTableView.dataSource = self
        mTableView.delegate = self
        
    }
    
    
    func bindViewModelData(){
        self.viewModel.bindVMToController = {
            self.mTableView.reloadData()
        }
    }
    
   

}

extension UserReviewViewController : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.userReviewList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "reviewCell"
        var  cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier)
                
        if (cell == nil){
            let nib:Array = Bundle.main.loadNibNamed("reviewCell", owner: self, options: nil)!
            cell = nib[0] as? UITableViewCell
                    
        }
        
        let data = viewModel.userReviewList[indexPath.row]
        
        let lblAutohor : UILabel = cell.viewWithTag(100) as! UILabel
        lblAutohor.text = data.author
        
        let lblContent : UILabel = cell.viewWithTag(200) as! UILabel
        lblContent.text = data.content
        
        
        return cell
    }
    

    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.userReviewList.count - 1 {  //numberofitem count
            viewModel.loadmoreReview()
            
        }
    }
    
    
}
