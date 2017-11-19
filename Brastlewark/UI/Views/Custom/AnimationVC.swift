//
//  AnimationVC.swift
//  Brastlewark
//
//  Created by Miguel Mañas Alvarez on 19/11/17.
//  Copyright © 2017 Miguel Mañas. All rights reserved.
//

import UIKit

class AnimationVC: BaseVC {

    
    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if #available(iOS 10.0, *) {
            buildAnimation()
        } else {
            // Fallback on earlier versions
        }
    }
    
    @available(iOS 10.0, *)
    func buildAnimation() {
        let logoAnimator =  UIViewPropertyAnimator(duration: 0.75, curve: .easeIn, animations: {
            
            self.logo.transform = CGAffineTransform(scaleX: 60.0, y: 60.0)
            
        })
        logoAnimator.startAnimation()
        logoAnimator.addCompletion({ (UIViewAnimatingPosition) in
            self.wireframe.GoToGnomeList(vc: self)
        })
    }
    
    
    

}
