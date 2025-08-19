
import UIKit
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let viewModel = ExploreViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var alphabetStackView: UIStackView!
    
//    private let alphabetFilter = AlphabetFilterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        viewModel.fetchAllRecipes(selectedAlphabet: "b") { [weak self] in
            self?.collectionView.reloadData()
        }
        
        addAlphabetButtons()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.recipeList.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as? RecipeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let meal = viewModel.recipeList[indexPath.item]
        cell.recipeTitleLabel.text = meal.strMeal
        
        // Load image async
        if let urlString = meal.strMealThumb, let url = URL(string: urlString) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        if collectionView.indexPath(for: cell) == indexPath { // avoid wrong cell image
                            cell.recipeImageView.image = image
                        }
                    }
                }
            }
        } else {
            cell.recipeImageView.image = UIImage(systemName: "photo")
        }
        
        return cell
    }
        
        // MARK: - UICollectionViewDelegateFlowLayout
        
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            let width = (collectionView.bounds.width - 16) / 2  // 2 per row with spacing
//            return CGSize(width: width, height: width * 1.2)
//        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 150)
    }
    
    // navigate to details view
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedRecipe = viewModel.recipeList[indexPath.row]

        if let detailVC = storyboard?.instantiateViewController(identifier: "DetailVC") as? DetailViewController {
            detailVC.meal = selectedRecipe
//            navigationController?.pushViewController(detailVC, animated: true)
            present(detailVC, animated: true)
        }
    }
    
    private func addAlphabetButtons() {
//        for letter in "ABCDEFGHIJKLMNOPQRSTUVWXYZ" {
//            let button = UIButton(type: .system)
//            button.setTitle(String(letter), for: .normal)
//            button.titleLabel?.font = AppFont.shared.bodySemibold
//            button.backgroundColor = .systemTeal
//            button.setTitleColor(.white, for: .normal)
//            
//            // Circle shape
//            button.layer.cornerRadius = 20
//            button.clipsToBounds = true
//            button.widthAnchor.constraint(equalToConstant: 40).isActive = true
//            button.heightAnchor.constraint(equalToConstant: 40).isActive = true
//            
//            // Add action
//            button.addTarget(self, action: #selector(alphabetButtonTapped(_:)), for: .touchUpInside)
//            
//            alphabetStackView.addArrangedSubview(button)
//        }
        
        for letter in "ABCDEFGHIJKLMNOPQRSTUVWXYZ" {
            let button = UIButton(type: .system)
            button.setTitle(String(letter), for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.backgroundColor = .systemTeal
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 20
            button.clipsToBounds = true
            
            // fixed circle size
            button.widthAnchor.constraint(equalToConstant: 40).isActive = true
            button.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
//            button.addAction(UIAction(handler: { [weak self] _ in
//                self?.onLetterTapped?(String(letter))
//            }), for: .touchUpInside)
            button.addTarget(self, action: #selector(alphabetButtonTapped(_:)), for: .touchUpInside)
            
            alphabetStackView.addArrangedSubview(button)
        }
    }
 
    @objc private func alphabetButtonTapped(_ sender: UIButton) {
        guard let letter = sender.currentTitle else { return }
        
        Task {
            do {
                let meals = try await viewModel.mealApiHandler.fetchMeals(byLetter: letter.lowercased())
                viewModel.recipeList = meals ?? []
                DispatchQueue.main.async { [weak self] in
                    self?.collectionView.reloadData()
                }
            } catch {
                print("Error fetching meals for \(letter): \(error)")
            }
        }
    }

}
