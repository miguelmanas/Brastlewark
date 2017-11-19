//
//  GnomesPresenter.swift
//  Brastlewark
//
//  Created by Miguel Mañas on 17/11/17.
//  Copyright © 2017 Miguel Mañas. All rights reserved.
//

import Foundation

class GnomesPresenter:GnomesActionListener{
    
    let interactor:GnomesInteractor?
    let view:GnomesView?
    
    init(interactor:GnomesInteractor?, view:GnomesView?){
        self.interactor = interactor
        self.view = view
    }
    
    
    
    func getGnomesData(){
        self.view?.startLoadingView()
        interactor?.getGnomesData().subscribe({ result in
            switch result {
                case .next(let gnomesData):
                    self.view?.getGnomesDataResponse(gnomes: gnomesData)
                    //print("getGnomesData(GnomesPresenter): \(gnomesData)")
                break
                case .error(_): break
            case .completed:
                self.view?.stopLoadingView()
                break
            }
        })
    }
    
    
}
