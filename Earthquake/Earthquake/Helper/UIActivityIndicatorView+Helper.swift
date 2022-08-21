//
//  LoadingActivityHelper.swift
//  Earthquake
//
//  Created by Anju Malhotra on 8/19/22.
//

import Foundation
import UIKit

extension UIActivityIndicatorView {
    /// Convfigure activityview.
    /// Private access so it cannot be modified from outside
    /// Returns self
    private func configureActivityIndicator(with view: UIView) -> UIActivityIndicatorView {
        self.color = UIColor.brown
        self.center = view.center
        self.startAnimating()
        return self
    }
    
    func showLoadingIndicator(with view: UIView) {
        view.addSubview(configureActivityIndicator(with: view))
    }
    
    func hideLoadingIndicator() {
        self.stopAnimating()
        self.removeFromSuperview()
    }
}
