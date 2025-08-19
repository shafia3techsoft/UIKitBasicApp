
import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Card style
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.peach.cgColor
        
        // Image rounding
        recipeImageView.contentMode = .scaleAspectFill
        recipeImageView.clipsToBounds = true
        recipeTitleLabel.font = AppFont.shared.titleRegular
    }
}

