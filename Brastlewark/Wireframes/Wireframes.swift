//
//  Wireframes.swift
//  Brastlewark
//
//  Created by Miguel Mañas on 17/11/17.
//  Copyright © 2017 Miguel Mañas. All rights reserved.
//

import Foundation


import Foundation
import UIKit

class Wireframes:UIViewController{
    
    func GoToGnomeList(vc:UIViewController){
        //let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let gnomesVC  = storyBoard.instantiateViewController(withIdentifier: String(describing: "GnomesListVC")) as! GnomesListVC
        
        let intectactor = GnomesInteractor()
        gnomesVC.presenter = GnomesPresenter(interactor: intectactor, view: gnomesVC)
        
        vc.present(gnomesVC, animated: false, completion: nil)
        
    }
    
    func GoTGnomeDetail(vc: UIViewController, gnome: Gnome){
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let gnomesDetailVC  = storyBoard.instantiateViewController(withIdentifier: String(describing: "GnomesDetailVC")) as! GnomeDetailVC
        
        gnomesDetailVC.gnome = gnome
        
        vc.navigationController?.pushViewController(gnomesDetailVC, animated: true)
        
        }
    
    
}
