//
//  EarthquakeCell.swift
//  Earthquake
//
//  Created by Anju Malhotra on 8/19/22.
//

import Foundation
import UIKit

final class EarthquakeCell: UITableViewCell {
    @IBOutlet var title: UILabel!
    @IBOutlet var magnitude: UILabel!
    @IBOutlet var date: UILabel!
    
    func configureCell(cellViewModel: EarthquakeCellViewModel) {
        title.text = cellViewModel.title
        magnitude.text = cellViewModel.magnitude
        date.text = cellViewModel.dateString
    }
}
