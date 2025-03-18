//
//  IngredientTableViewCell.swift
//  RadianceSearch
//
//  Created by admin2 on 09/03/25.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!

    override func awakeFromNib() {
           super.awakeFromNib()
           ratingImageView.contentMode = .scaleAspectFit
           iconImageView.isHidden = false
       }

       override func prepareForReuse() {
           super.prepareForReuse()
           iconImageView.image = nil
           iconImageView.isHidden = false
           ratingImageView.image = nil
           ratingImageView.tintColor = .clear
       }

    func configureWithIngredient(_ ingredient: Ingredient) {
        nameLabel.text = ingredient.name
        iconImageView.image = UIImage(systemName: "flask") // Placeholder icon

        // Ensure riskLevel is properly handled
        let riskLevel = ingredient.riskLevel.lowercased()
        ratingImageView.image = imageForRiskLevel(riskLevel)
        ratingImageView.tintColor = colorForRiskLevel(riskLevel)
        ratingImageView.isHidden = false
    }

       func configureWithProduct(_ product: Product) {
           nameLabel.text = product.name
           iconImageView.image = UIImage(systemName: "cube.box") // Placeholder for product

           // Hide rating for products
           ratingImageView.isHidden = true
       }

       // MARK: - Risk Level Helpers
       private func imageForRiskLevel(_ riskLevel: String) -> UIImage? {
           switch riskLevel {
           case "low":
               return UIImage(systemName: "checkmark.seal.fill") // Green Certified Symbol
           case "medium":
               return UIImage(systemName: "exclamationmark.triangle.fill") // Yellow Warning
           case "high":
               return UIImage(systemName: "exclamationmark.triangle.fill") // Red Warning
           default:
               return nil
           }
       }

       private func colorForRiskLevel(_ riskLevel: String) -> UIColor {
           switch riskLevel {
           case "low":
               return UIColor.systemGreen // Green
           case "medium":
               return UIColor.systemYellow // Yellow
           case "high":
               return UIColor.systemRed // Red
           default:
               return UIColor.systemGray // Default Gray
           }
       }
   }

