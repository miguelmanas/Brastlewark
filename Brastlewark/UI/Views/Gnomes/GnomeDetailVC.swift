//
//  GnomeDetailVC.swift
//  Brastlewark
//
//  Created by Miguel Mañas on 17/11/17.
//  Copyright © 2017 Miguel Mañas. All rights reserved.
//

import UIKit
import Kingfisher

class GnomeDetailVC: BaseVC {
    
    //Outlets
    @IBOutlet weak var gnomeImage: UIImageView!
    
    @IBOutlet weak var gnomeWeight: UILabel!
    @IBOutlet weak var gnomeHeight: UILabel!
    @IBOutlet weak var gnomeAge: UILabel!
    @IBOutlet weak var gnomeHairColor: UILabel!
    
    @IBOutlet weak var gnomeProfessions: UILabel!
    @IBOutlet weak var gnomeFriends: UILabel!
    
    @IBOutlet weak var gnomeCharacteristicsView: UIView!
    
    
    
    
    var gnome : Gnome?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gnomeCharacteristicsView.layer.cornerRadius = 10.0
        self.gnomeCharacteristicsView.layer.masksToBounds = true
        
       self.gnomeCharacteristicsView.layer.shadowOpacity = 0.18
        self.gnomeCharacteristicsView.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.gnomeCharacteristicsView.layer.shadowRadius = 2
        self.gnomeCharacteristicsView.layer.shadowColor = UIColor.black.cgColor
        self.gnomeCharacteristicsView.layer.masksToBounds = false
        self.navigationController?.navigationBar.isTranslucent = true
        
        if let gnome = gnome {
            self.title = gnome.name
            if let imgURL = gnome.thumbnail {
                let url = URL(string: imgURL)
                self.gnomeImage.kf.setImage(with: url, placeholder: UIImage(named: "gnome_1"), options: nil, progressBlock: nil, completionHandler: { (img, error, cache, url) in
                    self.gnomeImage.contentMode = .scaleAspectFill
                })
            }
            if let weight = gnome.weight {
                let doubleStr = String(format: "%.2f", weight)
                self.gnomeWeight.text = "\(doubleStr)"
            }
            if let height = gnome.height {
                let doubleStr = String(format: "%.2f", height)
                self.gnomeHeight.text = "\(doubleStr)"
            }
            if let age = gnome.age {
                self.gnomeAge.text = "\(age)"
            }
            if let hair_color = gnome.hair_color {
                self.gnomeHairColor.text = "\(hair_color)"
            }
            if let professions = gnome.professions {
                var professionsString = ""
                for profession in professions {
                    if professionsString == "" {
                        professionsString = profession
                    }else {
                        professionsString = "\(professionsString), \(profession)"
                    }
                }
                self.gnomeProfessions.text = "\(professionsString)"
            }
            if let friends = gnome.friends {
                var friendsString = ""
                for friend in friends {
                    if friendsString == "" {
                        friendsString = friend
                    }else {
                        friendsString = "\(friendsString), \(friend)"
                    }
                }
                self.gnomeFriends.text = "\(friendsString)"
            }
            
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("GnomeDetailVC")
    }

}
