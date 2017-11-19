//
//  GnomesInteractor.swift
//  Brastlewark
//
//  Created by Miguel Mañas on 17/11/17.
//  Copyright © 2017 Miguel Mañas. All rights reserved.
//

import Foundation
import RxSwift
import ObjectMapper

class GnomesInteractor{

    let networkManager = NetworkManager()
    let localManager = LocalManager()
    
    func getGnomesData() -> Observable<Brastlewark?> {
        
        return networkManager.getGnomesData().flatMap({ (result) -> Observable<Brastlewark?> in
            
            guard let JSONString = result else {return Observable.just(nil)}
            let gnomes = Brastlewark(JSONString: JSONString)
            return Observable.just(gnomes)
        })

    }
    
    
    
}

