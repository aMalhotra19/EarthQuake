//
//  NetworkServices.swift
//  Earthquake
//
//  Created by Anju Malhotra on 8/19/22.
//

import Foundation
import Combine

public final class NetworkServices {
    public init() {}
    
    public func fetchData(url: URL, completion: @escaping (Result<Data, Error>) -> Void ) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if error == nil {
                    guard let data = data else { return }
                    completion(.success(data))
                } else {
                    completion(.failure(error!))
                }
            }
        }.resume()
    }
}

