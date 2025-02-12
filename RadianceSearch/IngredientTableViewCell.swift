//
//  IngredientTableViewCell.swift
//  RadianceSearch
//
//  Created by admin2 on 15/11/24.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ratingImageView.contentMode = .scaleAspectFit
        iconImageView.isHidden = false
    }
    
    override func prepareForReuse() {
           super.prepareForReuse()
           iconImageView.image = nil // Reset to avoid reuse issues
           iconImageView.isHidden = false
       }

    func configure(withRating rating: Int) {
        ratingImageView.image = imageForRating(rating)
        ratingImageView.tintColor = colorForRating(rating) // Ensure rendering mode allows tintColor
    }

    private func imageForRating(_ rating: Int) -> UIImage? {
        switch rating {
        case 0...3:
            return UIImage(systemName: "checkmark.seal.fill") // Green Certified Symbol
        case 4...7:
            return UIImage(systemName: "exclamationmark.triangle.fill") //  Yellow Warning
        case 8...10:
            return UIImage(systemName: "exclamationmark.triangle.fill") //  Red Warning
        default:
            return nil
        }
    }

    private func colorForRating(_ rating: Int) -> UIColor {
        switch rating {
        case 0...3:
            return UIColor.systemGreen //  Green
        case 4...7:
            return UIColor.systemYellow // Yellow
        case 8...10:
            return UIColor.systemRed // Red
        default:
            return UIColor.systemGray
        }
    }
}

