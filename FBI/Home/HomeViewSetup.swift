//
//  HomeViewSetup.swift
//  FBI
//
//  Created by ADMIN on 09/10/19.
//  Copyright © 2019 Success Resource Pte Ltd. All rights reserved.
//

import Foundation
import UIKit

import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit
import FBSDKPlacesKit
import FacebookShare

import MobileCoreServices

extension HomeViewController {
    func setNewsTableView() {
        
        tableView.register(NewsTableCell.self, forCellReuseIdentifier: "NewsTableCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor)
        ])
    }
}

class NewsTableCell: UITableViewCell {
    let descriptionLabel = UILabel()
    let titleLabel = UILabel()
    let newsImage = UIImageView()
    let shareButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        setComponents()
    }
      
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    func setComponents() {
        // MARK:- For Title Label
        self.addSubview(titleLabel)
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 18),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 22),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        // MARK:- For Description Label
        self.addSubview(descriptionLabel)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 17.0)
        descriptionLabel.textColor = .gray
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 12),
            descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
            descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
        ])
        // MARK:- For News Image
        self.addSubview(newsImage)
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newsImage.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 8),
            newsImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            newsImage.widthAnchor.constraint(equalToConstant: 700),
            newsImage.heightAnchor.constraint(equalToConstant: 400)
        ])
        // MARK:- For Share Button
        self.addSubview(shareButton)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shareButton.topAnchor.constraint(equalTo: self.newsImage.bottomAnchor, constant: 12),
            shareButton.heightAnchor.constraint(equalToConstant: 38),
            shareButton.widthAnchor.constraint(equalToConstant: 84),
            shareButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            shareButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -18)
        ])
        shareButton.backgroundColor = .blue
        shareButton.layer.cornerRadius = 4
        shareButton.layer.masksToBounds = true
        shareButton.titleLabel?.textColor = .white
        shareButton.setTitle("Share", for: .normal)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData?.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableCell") as? NewsTableCell
        cell?.descriptionLabel.text = newsData?.articles?[indexPath.row].articleDescription
        cell?.titleLabel.text = newsData?.articles?[indexPath.row].title
        cell?.newsImage.downloadedImage(from: newsData?.articles?[indexPath.row].urlToImage ?? "http://www.jennybeaumont.com/wp-content/uploads/2015/03/placeholder.gif")
        cell?.shareButton.tag = indexPath.row
        cell?.shareButton.addTarget(self, action: #selector(shareToFB), for: .touchUpInside)
        return cell!
    }
    
    @objc func shareToFB(sender: UIButton){
//        print(sender.tag)
//        guard let url = newsData?.articles?[sender.tag].url else { return }
//        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
//        activityVC.popoverPresentationController?.sourceView = self.view
//        self.present(activityVC, animated: true)
        content.contentURL = URL(string: (newsData?.articles?[sender.tag].url ?? "https://google.com"))!
        showShareDialog(content)
    }
}
