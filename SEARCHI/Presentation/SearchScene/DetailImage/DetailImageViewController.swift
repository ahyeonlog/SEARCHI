//
//  DetailImageViewController.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/04/01.
//

import UIKit

final class DetailImageViewController: UIViewController {
    var viewModel: DetailImageViewModel?
    let mainView = DetailImageView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
}

private extension DetailImageViewController {
    func bindViewModel() {
        let input = DetailImageViewModel.Input()
        let output = viewModel?.transform(input: input)
        mainView.imageView.setImage(with: output?.imageURL ?? "")
        if let siteName = output?.displaySitename, let datetime = output?.datetime {
            if siteName.isEmpty {
                mainView.siteNameLabel.isHidden = true
            } else {
                mainView.siteNameLabel.isHidden = false
                mainView.siteNameLabel.text = "출처: \(siteName)"
            }
            if datetime.isEmpty {
                mainView.datetimeLabel.isHidden = true
            } else {
                mainView.datetimeLabel.isHidden = false
                mainView.datetimeLabel.text = datetime
            }
            
        }
        
        
    }
}
