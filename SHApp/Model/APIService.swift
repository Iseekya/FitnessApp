//
//  APIService.swift
//  SHApp
//
//  Created by Stefan Hitrov on 29.10.20.
//

import Foundation
import Alamofire

class APIService {
    
   static func getCalories(for ingridient: String, completionHandler: @escaping (Int) -> Void) {

        let url = "\(APIConstants.API_URL)&ingr=\(ingridient)"
        
        AF.request(url).validate().responseDecodable(of: Food.self) { (response) in
            
            guard let food = response.value else { return }
                
            completionHandler(food.calories)
            
        }
    }
    
}
