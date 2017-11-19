//
//  GnomeCell.swift
//  Brastlewark
//
//  Created by Miguel Mañas Alvarez on 17/11/17.
//  Copyright © 2017 Miguel Mañas. All rights reserved.
//

import UIKit
import Kingfisher

class GnomeCell: UICollectionViewCell {
    
    //Outlets
    @IBOutlet weak var gnomeImage: UIImageView!
    @IBOutlet weak var gnomeNameLabel: UILabel!
    
    override func awakeFromNib() {
        self.setupView()
    }
    
    func configCell(gnome: Gnome){
        guard let name = gnome.name else {return }
        if let imageURL = gnome.thumbnail {
            let url = URL(string: imageURL)
            self.gnomeImage.kf.setImage(with: url, placeholder: UIImage(named: "gnome_1"), options: nil, progressBlock: nil, completionHandler: { (img, error, cache, url) in
                self.gnomeImage.contentMode = .scaleAspectFill
                self.gnomeImage.layer.cornerRadius = 10.0
                self.gnomeImage.layer.masksToBounds = true
                
            })
        }
        gnomeNameLabel.text = name
    }
    
    func setupView(){
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
        
        self.layer.shadowOpacity = 0.18
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 2
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.masksToBounds = false
    }
    
    
}
