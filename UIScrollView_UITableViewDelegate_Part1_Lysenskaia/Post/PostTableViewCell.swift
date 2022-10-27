//
//  PostTableViewCell.swift
//  UIScrollView_UITableViewDelegate_Part1_Lysenskaia
//
//  Created by ElenaL on 24.10.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
    
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
    
            // Configure the view for the selected state
        }
    
    
    
    private var dataSource = [
    PostModel(author: "Cute Cat", description: "Saint Isaac's Cathedral or Isaakievskiy Sobor is a large architectural landmark cathedral that currently functions as a museum with occasional church services in Saint Petersburg, Russia. It is dedicated to Saint Isaac of Dalmatia, a patron saint of Peter the Great, who had been born on the feast day of that saint.", image: "IMG_1", likes: 220, views: 540), PostModel(author: "Cute Cat", description: "The State Hermitage Museum is a museum of art and culture in Saint Petersburg, Russia. It is the largest art museum in the world by gallery space.", image: "IMG_2.jpg", likes: 315, views: 550), PostModel(author: "Cute Cat", description: "Facing the Gulf of Finland, Petergof is known for the sprawling Peterhof Museum Complex, home to the 18th-century Grand Palace, elaborately landscaped gardens, and spectacular fountains with statues.", image: "IMG_3.jpeg", likes: 125, views: 365), PostModel(author: "Cute Cat", description: "Palace Bridge, a road- and foot-traffic bascule bridge, spans the Neva River in Saint Petersburg between Palace Square and Vasilievsky Island.", image: "IMG-4", likes: 115, views: 205)
    ]
    
    
//    struct ViewModel: ViewModelProtocol {
//            var author: String
//            var description: String
//            var image: String
//            var likes: String
//            var views: String
//        }

    private lazy var authorLabel: UILabel = {
            let label = UILabel()
            label.backgroundColor = .clear
            label.numberOfLines = 2
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.preferredMaxLayoutWidth = self.frame.size.width
            label.textColor = .black
            label.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
            label.translatesAutoresizingMaskIntoConstraints = false

            return label
        }()

        private lazy var postImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.backgroundColor = .black
            imageView.contentMode = .scaleAspectFit

            return imageView
        }()

        private lazy var descriptionLabel: UILabel = {
            let label = UILabel()
            label.backgroundColor = .clear
            label.preferredMaxLayoutWidth = self.frame.size.width
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = .systemGray
            label.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
            label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
            label.translatesAutoresizingMaskIntoConstraints = false

            return label
        }()

      

        private lazy var likeTitle: UILabel = {
            let label = UILabel()
            label.text  = "Likes: "
            label.backgroundColor = .clear
            label.font = UIFont.systemFont(ofSize: 16)
            label.preferredMaxLayoutWidth = self.frame.size.width
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false

            return label
        }()

        private lazy var viewTitle: UILabel = {
            let label = UILabel()
            label.text  = "Views: "
            label.backgroundColor = .clear
            label.font = UIFont.systemFont(ofSize: 16)
            label.preferredMaxLayoutWidth = self.frame.size.width
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false

            return label
        }()


        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            self.setupView()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func prepareForReuse() {
            super.prepareForReuse()
            self.authorLabel.text = nil
            self.postImageView.image = nil
            self.descriptionLabel.text = nil
            self.likeTitle.text = nil
            self.viewTitle.text = nil
        }

        private func setupView() {
            self.contentView.addSubview(self.authorLabel)
            self.contentView.addSubview(self.postImageView)
            self.contentView.addSubview(self.descriptionLabel)
            self.contentView.addSubview(self.likeTitle)
            self.contentView.addSubview(self.viewTitle)
            setupConstraints()
        }

        private func setupConstraints() {
            NSLayoutConstraint.activate([
            self.authorLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            self.authorLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.authorLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            
            self.postImageView.topAnchor.constraint(equalTo: self.authorLabel.bottomAnchor, constant: 12),
            self.postImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.postImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.postImageView.heightAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 1.0),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.postImageView.bottomAnchor, constant: 16),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            
            self.likeTitle.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 16),
            self.likeTitle.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.likeTitle.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),
            
            self.viewTitle.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 16),
            self.viewTitle.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.viewTitle.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16)
           
            ])
        }
    }

//    extension PostTableViewCell: Setupable {
//
//        func setup(with viewModel: ViewModelProtocol) {
//            guard let viewModel = viewModel as? ViewModel else { return }
//
//            self.authorLabel.text = viewModel.author
//            self.postImageView.image = UIImage(named: viewModel.image)
//            self.descriptionLabel.text = viewModel.description
//            self.likeTitle.text = "Likes: " + viewModel.likes
//            self.viewTitle.text = "Views: " + viewModel.views
//        }
//    }
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }


