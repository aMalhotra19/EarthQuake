//
//  ViewController.swift
//  Earthquake
//
//  Created by Anju Malhotra on 8/19/22.
//

import UIKit
import Network

final class EarthquakeViewController: UIViewController {
    @IBOutlet var earthQuakeTableView: UITableView!
    private let viewModel = EarthquakeViewModel()
    @IBOutlet var errorView: UIView!
    private let activityView = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
