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
        configure()
    }
    private func reloadView() {
        getData()
    }
    
    /// Gets data from api
    /// Adds and removes activity indicator when data is fetched

    private func getData() {
        activityView.showLoadingIndicator(with: view)
        viewModel.getdata { [weak self] in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                self.activityView.hideLoadingIndicator()
                if self.viewModel.earthQuakes != nil {
                    self.errorView.isHidden = true
                    if let currentAlert = self.presentedViewController as? UIAlertController {
                        currentAlert.dismiss(animated: true)
                    }
                    self.earthQuakeTableView.reloadData()
                } else {
                    switch self.viewModel.error {
                    case .noInternet:
                        self.errorView.isHidden = false
                    default:
                        self.errorView.isHidden = true
                        self.showAlert(self.viewModel.error?.errorDescription)
                    }
                }
            }
        }
    }
    @objc func refreshUI(refreshControl: UIRefreshControl) {
        reloadView()
        refreshControl.endRefreshing()
    }
    private func configure() {
        title = Constants.earthquakeTitle
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshUI(refreshControl:)), for: .valueChanged)
        self.earthQuakeTableView.refreshControl = refreshControl
        getData()
    }
    
    private func showAlert(_ error: String?) {
        if let currentAlert = self.presentedViewController as? UIAlertController {
            currentAlert.message = error
            return
        }
        let alert = UIAlertController(title: Constants.error, message: error, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: Constants.ok, style: .cancel)
        alert.addAction(actionOk)
        present(alert, animated: true, completion: nil)
    }

}

extension EarthquakeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(EarthquakeCell.self)") as? EarthquakeCell, let properties = viewModel.earthQuakes?.features[indexPath.row].properties else {
            return UITableViewCell()
        }
        let cellViewModel = EarthquakeCellViewModel(title: properties.title, magnitude: String(properties.mag), time: properties.time)
        cell.configureCell(cellViewModel: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let urlString = viewModel.earthQuakes?.features[indexPath.row].properties.url, let url = URL(string: urlString) else {
            showAlert(Constants.noUrlError)
            return
        }
        UIApplication.shared.open(url)
    }
}
