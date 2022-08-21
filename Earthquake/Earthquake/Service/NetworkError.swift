//
//  NetworkError.swift
//  Earthquake
//
//  Created by Anju Malhotra on 8/19/22.
//

import Foundation

public enum NetworkError: Error {
    case unknown
    case decodeError
    case noInternet
}

extension NetworkError {
    var errorDescription: String? {
        switch self {
        case .unknown:
            return ConstantString.unknownError
        case .decodeError:
            return ConstantString.decodeError
        case .noInternet:
            return ConstantString.noInternetError
        }
    }
}
