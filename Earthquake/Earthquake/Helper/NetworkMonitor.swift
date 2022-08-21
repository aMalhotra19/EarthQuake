//
//  NetworkMonitor.swift
//  Earthquake
//
//  Created by Anju Malhotra on 8/19/22.
//

import Foundation
import Network

class NetworkMonitor {
    static let shared = NetworkMonitor()
    private init() {}
    private var monitor: NWPathMonitor?
    private let queue = DispatchQueue(label: "Monitor")

    func monitorNetwork(completion: @escaping ((Bool) -> Void)) {
        monitor = NWPathMonitor()
        monitor?.pathUpdateHandler = { path in
            DispatchQueue.global().asyncAfter(deadline: .now() + 0.3, execute: {
                completion(path.status == .satisfied ? true : false)
            })
        }
        monitor?.start(queue: queue)
    }
    
    func stopMonitoring() {
        monitor?.cancel()
        monitor = nil
    }
}
