//
//  SegmentControlViewController.swift
//  RadianceSearch
//
//  Created by admin2 on 15/11/24.
//

import UIKit

class SegmentControlViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var filteredData: [Any] = []
    var selectedSegmentIndex: Int = 0
    var selectedIngredientDescription: IngredientDescription?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateFilteredData()
    
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        
        let selectedTextAttributes: [NSAttributedString.Key: Any] = [
                            .foregroundColor: UIColor.white,
                            .font: UIFont.systemFont(ofSize: 15, weight: .medium)]
                        let unselectedTextAttributes: [NSAttributedString.Key: Any] = [
                            .foregroundColor: UIColor(red: 62/255, green: 64/255, blue: 64/255, alpha: 1.0),
                            .font: UIFont.systemFont(ofSize: 15, weight: .medium)]

        segmentControl.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        segmentControl.setTitleTextAttributes(unselectedTextAttributes, for: .normal)
        
    }

    func setupUI() {
        segmentControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }

    @objc func segmentChanged() {
        selectedSegmentIndex = segmentControl.selectedSegmentIndex
        updateFilteredData()
        tableView.reloadData()
    }

    func updateFilteredData() {
        switch selectedSegmentIndex {
        case 0:
            filteredData = products
        case 1:
            filteredData = ingredients
        default:
            break
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }

    /*
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientTableViewCell", for: indexPath) as? IngredientTableViewCell else {
            return UITableViewCell()
        }

        if selectedSegmentIndex == 0, let product = filteredData[indexPath.row] as? ProductDataModel {
            cell.nameLabel.text = product.name
            cell.ratingImageView.isHidden = true
            
            // Set product icon
            cell.iconImageView.image = UIImage(systemName: "tube.fill") // Change to desired icon
            cell.iconImageView.isHidden = false
        } else if selectedSegmentIndex == 1, let ingredient = filteredData[indexPath.row] as? IngredientDataModel {
            cell.nameLabel.text = ingredient.name
            cell.ratingImageView.isHidden = false
            cell.configure(withRating: ingredient.rating)
            
            // Hide product icon for ingredient search
            cell.iconImageView.isHidden = true
        }

        return cell
    }
*/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientTableViewCell", for: indexPath) as? IngredientTableViewCell else {
            return UITableViewCell()
        }
        
        if selectedSegmentIndex == 0, let product = filteredData[indexPath.row] as? ProductDataModel {
            cell.nameLabel.text = product.name
            cell.nameLabel.numberOfLines = 0
            cell.nameLabel.lineBreakMode = .byWordWrapping
            cell.ratingImageView.isHidden = true

            // Set product icon from assets
            if let image = UIImage(named: "icon") {
                cell.iconImageView.image = image
                cell.iconImageView.isHidden = false
            } else {
                cell.iconImageView.isHidden = true
            }
        } else if selectedSegmentIndex == 1, let ingredient = filteredData[indexPath.row] as? IngredientDataModel {
            cell.nameLabel.text = ingredient.name
            cell.ratingImageView.isHidden = false
            cell.configure(withRating: ingredient.rating)

            // Set SF Symbol "atom" in black color
            let atomImage = UIImage(systemName: "flask")?.withRenderingMode(.alwaysTemplate)
            cell.iconImageView.image = atomImage
            cell.iconImageView.tintColor = .black
            cell.iconImageView.isHidden = false
        } else {
            cell.iconImageView.isHidden = true
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < filteredData.count else { return }

        let selectedIngredient: IngredientDataModel
        if let ingredient = filteredData[indexPath.row] as? IngredientDataModel {
            selectedIngredient = ingredient
        } else {
            return
        }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailVC = storyboard.instantiateViewController(withIdentifier: "IngredientDetailViewController") as? IngredientDetailViewController {
            if let ingredientDescription = getDescriptionForIngredient(selectedIngredient) {
                detailVC.ingredientDescription = ingredientDescription
            }
            self.navigationController?.pushViewController(detailVC, animated: true)
        }

        tableView.deselectRow(at: indexPath, animated: true)
    }

    private func getDescriptionForIngredient(_ ingredient: IngredientDataModel) -> IngredientDescription? {
        return IngredientDescriptionDataSource.description(for: ingredient)
    }

/*
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // Check if the segue identifier matches the one you want to control
        if identifier == "yourSegueIdentifier" {
            
            if segmentControl.selectedSegmentIndex == 1 {
                return true // Allow the segue to proceed
            } else {
                return false // Prevent the segue
            }
        }
        return true // Allow other segues
    }
*/

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            updateFilteredData()
        } else {
            if selectedSegmentIndex == 0 {
                filteredData = products.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            } else if selectedSegmentIndex == 1 {
                filteredData = ingredients.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            }
        }
        tableView.reloadData()
    }
    
    
     
     /*
      // MARK: - Navigation
      
      // In a storyboard-based application, you will often want to do a little preparation before navigation
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destination.
      // Pass the selected object to the new view controller.
      }
      */
     
}
     
     
