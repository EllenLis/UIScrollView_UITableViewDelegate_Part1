//
//  PostViewController.swift
//  UIScrollView_UITableViewDelegate_Part1_Lysenskaia
//
//  Created by ElenaL on 20.10.2022.
//

import UIKit

class PostViewController: UIViewController {

    var titlePost: String = "My Posts"
    
   
 //   private lazy var tableView: UITableView
    
   

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemMint
        navigationItem.title = "Пост"
        navigationItem.title = titlePost
        viewdidTapButton()
    }
            
    func viewdidTapButton() {
        let barButton = UIBarButtonItem()
        barButton.image = UIImage(systemName: "info.circle")
        barButton.action = #selector(didTapButton)
        barButton.target = self
        self.navigationItem.setLeftBarButton(barButton, animated: true) }
               
            
    @objc func didTapButton() {
        let vc = InfoViewController()
        vc.title = "Информация"
        vc.view.backgroundColor = .lightGray

        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
