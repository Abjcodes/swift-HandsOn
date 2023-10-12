//
//  EmployeeService.swift
//  apiV1
//
//  Created by P10 on 10/10/23.
//

import Foundation

class EmployeeService {
    static func fetchEmployees(completion: @escaping ([Employee]?, Error?) -> Void) {
        let apiUrlString = "https://dummy.restapiexample.com/api/v1/employees"
        
        if let url = URL(string: apiUrlString) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    completion(nil, NSError(domain: "HTTPError", code: 0, userInfo: nil))
                    return
                }
                
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let employeeResponse = try decoder.decode(EmployeeResponse.self, from: data)
                        completion(employeeResponse.data, nil)
                    } catch {
                        completion(nil, error)
                    }
                }
            }
            task.resume()
        }
    }
}
