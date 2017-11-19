//
//  BrastlewarkAPI.swift
//  Brastlewark
//
//  Created by Miguel Mañas on 17/11/17.
//  Copyright © 2017 Miguel Mañas. All rights reserved.
//

import Foundation
import Moya

private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}

enum BrastlewarkAPI {
    case getGnomesData()
    //https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json
}


// MARK: - TargetType Protocol Implementation
extension BrastlewarkAPI: TargetType {
    
    
    
    var parameters: [String : Any]? {
        return nil
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    var baseURL: URL { return URL(string: "https://raw.githubusercontent.com")! }
    
    var path: String {
        switch self {
        case .getGnomesData:
            return "/rrafols/mobile_test/master/data.json"
        }
    }
    var method: Moya.Method {
        switch self {
        case .getGnomesData:
            return .get
        }
    }
    var task: Task {
        return .request
    }
    var sampleData: Data {
        return "Sample Data".data(using: String.Encoding.utf8)!
    }
    
    
    
    var headers: [String: String]? {
        return nil
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
