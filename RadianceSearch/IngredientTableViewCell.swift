//
//  IngredientTableViewCell.swift
//  RadianceSearch
//
//  Created by admin2 on 15/11/24.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initial setup for ratingLabel
        ratingLabel.layer.cornerRadius = ratingLabel.frame.size.width / 2
        ratingLabel.layer.masksToBounds = true
        ratingLabel.textAlignment = .center
        ratingLabel.textColor = .white
    }
    
    func configure(withRating rating: Int) {
        ratingLabel.text = "\(rating)"
        ratingLabel.backgroundColor = colorForRating(rating)
    }
    
    private func colorForRating(_ rating: Int) -> UIColor {
        switch rating {
        case 0...3:
            return UIColor.systemGreen // Low risk
        case 4...7:
            return UIColor.systemYellow // Medium risk
        case 8...10:
            return UIColor.systemRed   // High risk
        default:
            return UIColor.systemGray
        }
    }
}
