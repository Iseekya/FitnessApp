//
//  Service.swift
//  SHApp
//
//  Created by Stefan Hitrov on 30.10.20.
//

import Foundation

class Service {
    
    
    static func fetchFood(for ingridient: String, completion: @escaping (Int) -> Void) {
        
        let urlString = "\(APIConstants.API_URL)&ingr=\(ingridient)"
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { (data, resp, err) in
            
            if err == nil && data != nil {
                // Parse JSON
                let decoder = JSONDecoder()
                
                do {
                    let food = try decoder.decode(Food.self, from: data!)
                    print(food)
                }
                catch {
                    print("Error in JSON parsing")
                }
               
            }
        }
        dataTask.resume()
        
    }
    
}
