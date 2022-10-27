//
//  ProfileViewController.swift
//  UIScrollView_UITableViewDelegate_Part1_Lysenskaia
//
//  Created by ElenaL on 20.10.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 12
        button.setTitle("Сменить заголовок", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(titleButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        self.view.addSubview(self.profileHeaderView)
        setupView()
        tapGesturt()
        setTitleStackView()
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = "Профиль"
    }
    
    private func setupView() {
        self.view.backgroundColor = .lightGray
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ])
        
    }
    
    let blue = UIColor(named: "#4885CC")
    
    func tapGesturt() {
        let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(view.endEditing))
        self.view.addGestureRecognizer(tapGesture)
    }

    func setTitleStackView() {
        self.profileHeaderView.addSubview(titleButton)
        
        NSLayoutConstraint.activate([
            titleButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            titleButton.heightAnchor.constraint(equalToConstant: 50),
            titleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])

    }
    @objc private func titleButtonAction() {}

}
