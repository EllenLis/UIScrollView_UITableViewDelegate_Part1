//
//  ProfileHeaderView.swift
//  UIScrollView_UITableViewDelegate_Part1_Lysenskaia
//
//  Created by ElenaL on 20.10.2022.
//

import UIKit

protocol ProfileHeaderViewProtocol: AnyObject {
    func buttonPressed()
}

class ProfileHeaderView: UIView, ProfileHeaderViewProtocol {
    
    var statusText: String? = nil
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "2-1.jpeg"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 70.0
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var firstStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var secondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 40
        return stackView
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text  = "Cute Cat"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Waiting for something..."
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14.0)
        return statusLabel
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.isHidden = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15.0)
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 12.0
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.clipsToBounds = true
        textField.placeholder = "Waiting for something..."
        return textField
    }()
    
    private lazy var setStatusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.setTitle("Set status", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.backgroundColor = .blue
        statusButton.layer.cornerRadius = 4
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        statusButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        statusButton.layer.shadowRadius = 4.0
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.layer.shouldRasterize = true
        
        return statusButton
    }()
    
    private var buttonTopConstrain: NSLayoutConstraint?
    
    weak var delegate: ProfileHeaderViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been")
    }
    
    func createSubviews() {
        self.addSubview(firstStackView)
        self.addSubview(statusTextField)
        self.addSubview(setStatusButton)
        self.firstStackView.addArrangedSubview(avatarImageView)
        self.firstStackView.addArrangedSubview(secondStackView)
        self.secondStackView.addArrangedSubview(fullNameLabel)
        self.secondStackView.addArrangedSubview(statusLabel)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            firstStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            firstStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            firstStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor, multiplier: 1.0),
            
            setStatusButton.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    @objc internal func buttonPressed() {
        
        statusLabel.text = statusText
        print (statusLabel.text ?? "nil")
        
    }
        
        func statusTextChanged(_ textField: UITextField) {
            if let text = textField.text {
                statusText = text
            }
        }
        
    }
    
