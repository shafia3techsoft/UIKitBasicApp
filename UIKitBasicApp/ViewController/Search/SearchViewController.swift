//
//  ExploreViewController.swift
//  UIKitBasicApp
//
//  Created by shafia on 11/08/2025.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var searchBarAnime: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = SearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        searchBarAnime.delegate = self
        tableView.backgroundColor = .peach3

        viewModel.fetchAllRecipes { [weak self] in
            self?.tableView.reloadData()
        }
        
    }

    // MARK: - UITableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.recipeList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
//        if indexPath.row < viewModel.recipeList.count {
//            
//        }
        
        if indexPath.row >= viewModel.recipeList.count {
            return UITableViewCell() // or fatalError("Unexpected index")
        }
        
        let recipe = viewModel.recipeList[indexPath.row]
        
        cell.nameLabel.text = recipe.strMeal
        cell.nameLabel.font = AppFont.shared.titleRegular
        cell.nameLabel.textColor = .peach
//        cell.recipeImageView.image = UIImage(named: recipe.imageName)
        
        // Load image async
        if let urlString = recipe.strMealThumb, let url = URL(string: urlString) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        if tableView.indexPath(for: cell) == indexPath { // avoid wrong cell image
                            cell.recipeImageView.image = image
                        }
                    }
                }
            }
        } else {
            cell.recipeImageView.image = UIImage(systemName: "photo")
        }

        
        cell.recipeImageView.layer.cornerRadius = 10
        cell.recipeImageView.clipsToBounds = true

        cell.backgroundColor = .peach3
        
        cell.contentView.backgroundColor = .peach2
        cell.contentView.layer.cornerRadius = 15

        
        return cell
    }

    // MARK: - UITableView Delegate (optional)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected: \(viewModel.recipeList[indexPath.row].strMeal)")
        let selectedRecipe = viewModel.recipeList[indexPath.row]

        if let detailVC = storyboard?.instantiateViewController(identifier: "DetailVC") as? DetailViewController {
            detailVC.meal = selectedRecipe
//            navigationController?.pushViewController(detailVC, animated: true)
            present(detailVC, animated: true)

        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // MARK: - Search Bar Delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
//            filteredAnimeList = animeList.filter { $0.name.lowercased().contains(searchText.lowercased()) }
//            viewModel.fetchRecipesByNameAndIng(searchStr: searchText, completion: {})
            
            viewModel.fetchRecipesByNameAndIng(searchStr: searchText) { [weak self] in
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }

        }
//        tableView.reloadData()
        
    }

}

