//
//  ProfileImage.swift
//  Covace
//
//  Created by Muhammad Nobel Shidqi on 26/08/20.
//  Copyright © 2020 Muhammad Nobel Shidqi. All rights reserved.
//

import UIKit

protocol ProfileImageDelegate {
    func profileImageDidTap()
}

class ProfileImage: UIView {
    
    var imageView: UIImageView?
    var delegate: ProfileImageDelegate?
    var tapGesture: UITapGestureRecognizer?
    static var defaultSize: CGFloat = 75
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        self.addGestureRecognizer(tapGesture!)
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(size: CGFloat? = ProfileImage.defaultSize, image: UIImage? = .defaultProfile) {
        self.backgroundColor = .systemGray
        self.frame = frame
        self.size(width: size!, height: size!)
        self.roundingCorners(for: [.all], withRadius: size!/2)
        
        self.shadow(x: 1, y: 1, radius: 3)
        imageView = UIImageView(image: image)
        
        guard let imageView = self.imageView else {return}
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        self.addSubview(imageView)
        imageView.anchor(top: self.topAnchor, trailing: self.trailingAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor)
        imageView.roundingCorners(for: [.all], withRadius: size!/2)
        
        
    }
    
    @objc private func didTap() {
        delegate?.profileImageDidTap()
    }
    
}
