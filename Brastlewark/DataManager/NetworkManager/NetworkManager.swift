//
//  NetworkManager.swift
//  Brastlewark
//
//  Created by Miguel Mañas on 17/11/17.
//  Copyright © 2017 Miguel Mañas. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class NetworkManager{
    
    
    let provider = RxMoyaProvider<BrastlewarkAPI>()
    
    func getGnomesData() -> Observable<String?> {
        
        return provider.request(.getGnomesData()).filterSuccessfulStatusCodes().mapString().flatMap({ (result) -> Observable<String?> in
            
            return Observable.just(result)
        }).catchError({ (error) -> Observable<String?> in
            return Observable.just(nil)
        })

    }
   

}
