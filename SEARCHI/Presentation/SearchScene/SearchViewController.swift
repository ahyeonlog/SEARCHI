//
//  SearchViewController.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/03/30.
//

import UIKit

final class SearchViewController: UIViewController {
    let mainView = SearchView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.titleView = mainView.searchBar
    }


}


