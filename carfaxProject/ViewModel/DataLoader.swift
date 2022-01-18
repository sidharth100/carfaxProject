//
//  DataLoader.swift
//  carfaxProject
//
//  Created by Sidharth Mehta on 2021-12-22.
//

import Foundation

class DataLoader {
    
      static let sharedInstance = DataLoader()
    
    private var dataTask: URLSessionDataTask?
    
    func getUsedCars(completion: @escaping (assignment?) -> Void){
        let vehicleUrl = "https://carfax-for-consumers.firebaseio.com/assignment.json"
        guard let url = URL(string: vehicleUrl) else { return }
        
        // Creating URL Session

        dataTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            // Handling error
            if let error = error {
                
                print("DataTask Error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Empty Response")
                return
            }
            
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
                print("No data")
                return
            }
            
            do{
                print(data)
                // Parse the data
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(assignment.self, from: data)
                
                DispatchQueue.main.async {
                    
                    completion(jsonData)
                    
                }
                
                
            } catch let error {
              print(error)
            }
        })
        
        dataTask?.resume()
    }
    
    
    
}
