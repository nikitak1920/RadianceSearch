//
//  IngredientDetailViewController.swift
//  RadianceSearch
//
//  Created by admin2 on 16/11/24.
//

import UIKit

class IngredientDetailViewController: UIViewController {
    
    @IBOutlet weak var ingredientImageView: UIImageView!
    @IBOutlet weak var ingredientNameLabel: UILabel!
    @IBOutlet weak var akaLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var usageLabel: UILabel!
    @IBOutlet weak var healthImpactLabel: UILabel!
    @IBOutlet weak var sourceLinkLabel: UILabel!
    
    var ingredientDescription: IngredientDescription?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        guard let description = ingredientDescription else { return }
        
        // Set ingredient details
        ingredientImageView.image = description.image?.withRenderingMode(.alwaysTemplate)  // Enable tint for the image
        ingredientNameLabel.text = description.name
        akaLabel.text = description.aka
        descriptionLabel.text = description.description
        usageLabel.text = description.usage
        healthImpactLabel.text = description.healthImpact
        
        // Set source link if available
        if let sourceLink = description.sourceLink.first {
            let attributedString = NSMutableAttributedString(string: "Source")
            attributedString.append(NSAttributedString(string: " - \(sourceLink)", attributes: [.link: sourceLink]))
            sourceLinkLabel.attributedText = attributedString
            sourceLinkLabel.isUserInteractionEnabled = true
        }
        
        // Set the symbol color based on the risk level
        switch description.riskLevel.lowercased() {
        case "low":
            ingredientImageView.tintColor = UIColor.systemGreen
        case "medium":
            ingredientImageView.tintColor = UIColor.systemYellow
        case "high":
            ingredientImageView.tintColor = UIColor.systemRed
        default:
            ingredientImageView.tintColor = UIColor.gray  // Default color if risk level is unknown
        }
    }

    
    /*
    private func configureView() {
        guard let description = ingredientDescription else { return }
        
        ingredientImageView.image = description.image
        ingredientNameLabel.text = description.name
        akaLabel.text = description.aka
        descriptionLabel.text = description.description
        usageLabel.text = description.usage
        healthImpactLabel.text = description.healthImpact
        
        if let sourceLink = description.sourceLink.first {
            let attributedString = NSMutableAttributedString(string: "Source")
            attributedString.append(NSAttributedString(string: " - \(sourceLink)", attributes: [.link: sourceLink]))
            sourceLinkLabel.attributedText = attributedString
            sourceLinkLabel.isUserInteractionEnabled = true
        }
    }
*/


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
