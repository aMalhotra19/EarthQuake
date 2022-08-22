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
    private func configure(with view: UIView) -> UIActivityIndicatorView {
        self.color = UIColor.brown
        self.center = view.center
        self.startAnimating()
        return self
    }
    
    func show(with view: UIView) {
        view.addSubview(configure(with: view))
    }
    
    func hide() {
        self.stopAnimating()
        self.removeFromSuperview()
    }
}
