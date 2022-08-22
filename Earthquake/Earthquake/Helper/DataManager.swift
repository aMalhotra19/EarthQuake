//
//  DataManager.swift
//  Earthquake
//
//  Created by Anju Malhotra on 8/19/22.
//

import Foundation
import NetworkCore
/// Data Manager will help manage data to fetch from different sources
/// such as for future implementation, if data needs to be stored in persistent storage or cache for any other usecase
final class DataManager {
    
    static let shared = DataManager()
    private init() {}
    
    func loadData(completion: @escaping (Result<Earthquake, NetworkError>) -> Void ) {
        ServiceManager().fetchEarthquakeData(from: Constants.urlString+DateUtility.currentDate()) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure( let error):
                completion(.failure(error))
            }
        }
    }
}
