//
//  SegmentControlViewController.swift
//  RadianceSearch
//
//  Created by admin2 on 09/03/25.
//

import UIKit

class SegmentControlViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    private var ingredients: [Ingredient] = []
    private var products: [Product] = []
    private var filteredIngredients: [Ingredient] = []
    private var filteredProducts: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        // Set the text color of the selected segment to white
        let selectedTextAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
        segmentControl.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        
        fetchData()
    }

    private func fetchData() {
        fetchIngredients { ingredients, error in
            guard let ingredients = ingredients, error == nil else {
                print("Error fetching ingredients:", error?.localizedDescription ?? "Unknown error")
                return
            }
            self.ingredients = ingredients
            self.filteredIngredients = ingredients
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        fetchProducts { products, error in
            guard let products = products, error == nil else {
                print("Error fetching products:", error?.localizedDescription ?? "Unknown error")
                return
            }
            self.products = products
            self.filteredProducts = products
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func fetchIngredients(completion: @escaping ([Ingredient]?, Error?) -> Void) {
        Task {
            do {
                let ingredients: [Ingredient] = try await supabase
                    .from("ingredients")
                    .select()
                    .execute()
                    .value
                
                DispatchQueue.main.async {
                    completion(ingredients, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
    }

    func fetchProducts(completion: @escaping ([Product]?, Error?) -> Void) {
        Task {
            do {
                let products: [Product] = try await supabase
                    .from("products")
                    .select()
                    .execute()
                    .value
                
                DispatchQueue.main.async {
                    completion(products, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
    }

    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        searchBar.text = ""
        tableView.reloadData()
    }
}

extension SegmentControlViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchTerm = searchText.lowercased()

        if segmentControl.selectedSegmentIndex == 0 {
            filteredProducts = searchTerm.isEmpty ? products : products.filter { $0.name.lowercased().contains(searchTerm) }
        } else {
            filteredIngredients = searchTerm.isEmpty ? ingredients : ingredients.filter { $0.name.lowercased().contains(searchTerm) }
        }

        tableView.reloadData()
    }
}

extension SegmentControlViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentControl.selectedSegmentIndex == 0 {
            return filteredProducts.count
        } else {
            return filteredIngredients.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientTableViewCell", for: indexPath) as? IngredientTableViewCell else {
            return UITableViewCell()
        }
        
        if segmentControl.selectedSegmentIndex == 0 {
            // Display Product
            let product = filteredProducts[indexPath.row]
            cell.configureWithProduct(product)
            
            // Set unfilled SF Symbols for products based on product name
            let productName = product.name.lowercased()
            
            var systemImageName: String = "cube" // Default fallback unfilled icon
            
            if productName.contains("sunscreen") {
                systemImageName = "sun.min" // unfilled sun
            } else if productName.contains("moisturizer") {
                systemImageName = "drop" // unfilled drop
            } else if productName.contains("cleanser") || productName.contains("face wash") {
                systemImageName = "sparkles" // unfilled sparkles
            } else if productName.contains("eye cream") {
                systemImageName = "eye" // unfilled eye
            } else if productName.contains("toner") {
                systemImageName = "leaf" // unfilled leaf
            }
            
            cell.iconImageView.image = UIImage(systemName: systemImageName)
            cell.iconImageView.tintColor = .black
            cell.iconImageView.isHidden = false
            
            // Hide rating image for products
            cell.ratingImageView.isHidden = true
            
        } else {
            // Display Ingredient
            let ingredient = filteredIngredients[indexPath.row]
            cell.configureWithIngredient(ingredient)
            
            // Use your asset "icon" for ingredient images
            if let assetImage = UIImage(named: "icon") {
                cell.iconImageView.image = assetImage
            } else {
                cell.iconImageView.image = nil // No fallback, leave it blank
            }
            
            cell.iconImageView.isHidden = false
            
            // Show rating image for ingredients
            cell.ratingImageView.isHidden = false
        }
        
        return cell
    }



    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if segmentControl.selectedSegmentIndex == 1 {
            let ingredient = filteredIngredients[indexPath.row]

            if let detailVC = storyboard?.instantiateViewController(withIdentifier: "IngredientDetailViewController") as? IngredientDetailViewController {
                detailVC.ingredient = ingredient
                navigationController?.pushViewController(detailVC, animated: true)
            }
        }
    }
}
