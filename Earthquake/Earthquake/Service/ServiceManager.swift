//
//  ServiceManager.swift
//  Earthquake
//
//  Created by Anju Malhotra on 8/19/22.
//

import Foundation
import Combine
import NetworkCore

protocol ApiCreator {
    func fetchEarthquakeData(from urlString: String, completion: @escaping (Result<Earthquake, NetworkError>) -> Void )
}

final class ServiceManager: ApiCreator {
    /// Network Monitor will check connectivity and call to fetch data willl be made
    /// If internet is not available return failure

    func fetchEarthquakeData(from urlString: String, completion: @escaping (Result<Earthquake, NetworkError>) -> Void ) {
        guard let url = URL(string: urlString) else {
            fatalError()
        }
        NetworkMonitor.shared.monitorNetwork { status in
            guard status else {
                completion(.failure(NetworkError.noInternet))
                return
            }
            NetworkServices().fetchData(url: url) { result in
                switch result {
                case .failure(_):
                    completion(.failure(NetworkError.noInternet))
                case .success(let data):
                    do {
                        NetworkMonitor.shared.stopMonitoring()
                        let modelObject = try JSONDecoder().decode(Earthquake.self, from: data)
                        completion(.success(modelObject))
                    } catch {
                        completion(.failure(NetworkError.decodeError))
                    }
                }
            }
        }
    }
}
