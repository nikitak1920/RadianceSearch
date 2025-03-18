//
//  IngredientDetailViewController.swift
//  RadianceSearch
//
//  Created by admin2 on 09/03/25.
//

import UIKit

import UIKit

class IngredientDetailViewController: UIViewController {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var akaLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var usageLabel: UILabel!
    @IBOutlet weak var healthImpactLabel: UILabel!
    @IBOutlet weak var sourceLinkLabel: UILabel!

    var ingredient: Ingredient?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        guard let ingredient = ingredient else { return }

        titleLabel.text = ingredient.name
        akaLabel.text = "Also Known As: \(ingredient.aka)"
        descriptionLabel.text = "Description: \(ingredient.description)"
        usageLabel.text = "Usage: \(ingredient.usage)"
        healthImpactLabel.text = "Health Impact: \(ingredient.healthImpact)"
        
        // Set icon image based on risk level
        let riskLevel = ingredient.riskLevel.lowercased()
        iconImageView.image = imageForRiskLevel(riskLevel)
        iconImageView.tintColor = colorForRiskLevel(riskLevel)
        
        // Ensure URL is valid
        if let urlString = ingredient.sourceLink, let _ = URL(string: urlString) {
            sourceLinkLabel.text = "Source: Tap to open"
            sourceLinkLabel.textColor = .systemBlue
            sourceLinkLabel.isUserInteractionEnabled = true

            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openSourceLink))
            sourceLinkLabel.addGestureRecognizer(tapGesture)
        } else {
            sourceLinkLabel.text = "Source: Not available"
            sourceLinkLabel.textColor = .gray
            sourceLinkLabel.isUserInteractionEnabled = false
        }
    }

    private func imageForRiskLevel(_ riskLevel: String) -> UIImage? {
        switch riskLevel {
        case "low":
            return UIImage(systemName: "checkmark.seal.fill") // Safe ingredient icon
        case "medium":
            return UIImage(systemName: "exclamationmark.triangle.fill") // Moderate warning icon
        case "high":
            return UIImage(systemName: "exclamationmark.triangle.fill") // High-risk warning icon
        default:
            return UIImage(systemName: "questionmark.circle.fill") // Default unknown icon
        }
    }

    private func colorForRiskLevel(_ riskLevel: String) -> UIColor {
        switch riskLevel {
        case "low":
            return UIColor.systemGreen
        case "medium":
            return UIColor.systemYellow
        case "high":
            return UIColor.systemRed
        default:
            return UIColor.gray
        }
    }

    @objc private func openSourceLink() {
        if let urlString = ingredient?.sourceLink, let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}


