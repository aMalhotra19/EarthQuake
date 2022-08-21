//
//  NetworkMonitor.swift
//  Earthquake
//
//  Created by Anju Malhotra on 8/19/22.
//

import Foundation
import Network

public class NetworkMonitor {
    public static let shared = NetworkMonitor()
    private init() {}
    private var monitor: NWPathMonitor?
    private let queue = DispatchQueue(label: "Monitor")

    public func monitorNetwork(completion: @escaping ((Bool) -> Void)) {
        monitor = NWPathMonitor()
        monitor?.pathUpdateHandler = { path in
            DispatchQueue.global().asyncAfter(deadline: .now() + 0.3, execute: {
                completion(path.status == .satisfied ? true : false)
            })
        }
        monitor?.start(queue: queue)
    }
    
    public func stopMonitoring() {
        monitor?.cancel()
        monitor = nil
    }
}
