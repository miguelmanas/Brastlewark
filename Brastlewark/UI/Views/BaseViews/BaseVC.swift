//
//  BaseVC.swift
//  Brastlewark
//
//  Created by Miguel Mañas on 17/11/17.
//  Copyright © 2017 Miguel Mañas. All rights reserved.
//

import Foundation
import UIKit
import APESuperHUD

class BaseVC: UIViewController {

    let wireframe : Wireframes = Wireframes()

    func startLoading(){
        APESuperHUD.showOrUpdateHUD(loadingIndicator: .standard, message: "", presentingView: self.view)
    }

    func stopLoading(){
        APESuperHUD.removeHUD(animated: true, presentingView: self.view, completion: nil)
    }


}

