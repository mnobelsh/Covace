//
//  HomeViewController.swift
//  Covace
//
//  Created by Muhammad Nobel Shidqi on 26/08/20.
//  Copyright © 2020 Muhammad Nobel Shidqi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let countryLabel: UILabel = .body(for: .stringify("Negara"), withSize: .medium, andStyle: .secondary)
    let headerLabel: UILabel = .heading(for: .stringify("Provinsi / Daerah"), withSize: .large, andStyle: .primary)
    
    let card: UIView = {
        let view: UIView = .card(size: CGSize(width: 130, height: 170))
        view.backgroundColor = .systemYellow
        return view
    }()
    
    lazy var profileImage: ProfileImage = {
        let profileImage = ProfileImage()
        profileImage.configure(image: #imageLiteral(resourceName: "profile"))
        profileImage.delegate = self
        return profileImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        self.view.backgroundColor = .backgroundColor
        
        self.view.addSubview(headerLabel)
        headerLabel.setCenterXYAnchor(in: self.view)
        
        self.view.addSubview(countryLabel)
        countryLabel.anchor(bottom: headerLabel.topAnchor, leading: headerLabel.leadingAnchor, paddingBottom: 3)
        
        self.view.addSubview(card)
        card.setCenterXAnchor(in: self.view)
        card.anchor(top: headerLabel.bottomAnchor, paddingTop: 8)
        
        self.view.addSubview(profileImage)
        profileImage.setCenterXAnchor(in: self.view)
        profileImage.anchor(bottom: countryLabel.topAnchor, paddingBottom: 8)
    }
    
    
}

extension HomeViewController: ProfileImageDelegate {
    
    func profileImageDidTap() {
        print("Profile Image tapped")
    }

}
