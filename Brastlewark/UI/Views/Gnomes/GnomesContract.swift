//
//  GnomesContract.swift
//  Brastlewark
//
//  Created by Miguel Mañas on 17/11/17.
//  Copyright © 2017 Miguel Mañas. All rights reserved.
//

import Foundation

protocol GnomesView {
    func getGnomesDataResponse(gnomes: Brastlewark?)
    func startLoadingView()
    func stopLoadingView()
}

protocol GnomesActionListener {
    func getGnomesData()
}


