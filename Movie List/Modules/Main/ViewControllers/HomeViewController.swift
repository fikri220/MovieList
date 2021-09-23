//
//  ViewController.swift
//  Movie List
//
//  Created by Fikri Ihsan on 21/09/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel : HomeViewModel!
    @IBOutlet var mHeader: UIView!
    @IBOutlet weak var mTableView: UITableView!
    
    @IBOutlet weak var mBtnAction: UIButton!
    @IBOutlet weak var mBtnAdventure: UIButton!
    @IBOutlet weak var mBtnComedy: UIButton!
    @IBOutlet weak var mBtnMore: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Bundle.main.loadNibNamed("HomeHeaderView", owner: self, options: nil)
        mTableView.tableHeaderView = mHeader
        
        mBtnMore.addTarget(self, action:  #selector(self.onClicked(sender:)), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc func onClicked(sender : UIButton){
        if(sender == mBtnMore){
            viewModel.goToGenre()
        }
    }


}

