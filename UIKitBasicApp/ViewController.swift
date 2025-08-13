//
//  ViewController.swift
//  UIKitBasicApp
//
//  Created by shafia on 11/08/2025.
//

import UIKit


//class ViewController: UIViewController {
//    
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBAction func simpleButton(_ sender: UIButton) {
//        titleLabel.text = "Simple Button Clicked!"
//    }
//    
//    @IBAction func tintedButton(_ sender: UIButton) {
//        titleLabel.text = "Tinted Button Clicked!"
//    }
//    @IBOutlet weak var textField : UITextField!
//    @IBOutlet weak var hStack: UIStackView!
//    
//    @IBOutlet weak var textField: UITextField!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    
//        
//        titleLabel.text = "Yes i am in Explore View"
//        titleLabel.textColor = UIColor.green
//        hStack.translatesAutoresizingMaskIntoConstraints = false
//        hStack.layer.borderColor = UIColor.systemIndigo.cgColor
//        hStack.layer.borderWidth = 1.5
//        hStack.layer.cornerRadius = 8.0
//        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
//    }
//    
//    @objc func textFieldDidChange(_ textField: UITextField) {
//        print("Text changed: \(textField.text ?? "")")
//        titleLabel.text = "You typed: \(textField.text ?? "")"
//    }
//
//}



class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
//    var animeList: [AnimeMovie] = [
//        AnimeMovie(name: "Naruto", backgroundColor: .systemOrange, imageName: "naruto"),
//        AnimeMovie(name: "Demon Slayer", backgroundColor: .black, imageName: "demonslayer"),
//        AnimeMovie(name: "One Piece", backgroundColor: .systemRed, imageName: "onepiece"),
//        AnimeMovie(name: "Attack on Titan", backgroundColor: .systemGray, imageName: "aot"),
//        AnimeMovie(name: "Death Note", backgroundColor: .darkGray, imageName: "deathnote"),
//        AnimeMovie(name: "My Hero Academia", backgroundColor: .systemBlue, imageName: "mha"),
//        AnimeMovie(name: "Fullmetal Alchemist", backgroundColor: .brown, imageName: "fma"),
//        AnimeMovie(name: "Dragon Ball Z", backgroundColor: .systemYellow, imageName: "dbz"),
//        AnimeMovie(name: "Bleach", backgroundColor: .systemIndigo, imageName: "bleach"),
//        AnimeMovie(name: "Jujutsu Kaisen", backgroundColor: .purple, imageName: "jujutsu"),
//        AnimeMovie(name: "Tokyo Ghoul", backgroundColor: .systemTeal, imageName: "tokyoghoul"),
//        AnimeMovie(name: "Hunter x Hunter", backgroundColor: .systemGreen, imageName: "hxh")
//    ]
    
    var animeList = [
        AnimeMovie(
            name: "Attack on Titan",
            backgroundColor: .systemGray,
            imageName: "aot",
            details: """
    Attack on Titan is a dark fantasy anime set in a world where humanity resides within enormous walled cities to protect themselves from giant humanoid creatures known as Titans. The story follows Eren Yeager, Mikasa Ackerman, and Armin Arlert as they join the military after their hometown is destroyed by a colossal Titan. Over time, they uncover horrifying truths about the Titans, the origins of their world, and the political corruption within the walls. Attack on Titan blends intense action, mystery, and political drama, often confronting moral dilemmas and challenging the idea of good versus evil. The series is celebrated for its unpredictable plot twists, layered storytelling, and emotionally complex characters, making it one of the most talked-about anime of its era. Themes of freedom, survival, and the cost of war are central to its narrative, and the animation quality — particularly in battle sequences — has been praised worldwide.
    
    Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.
    """
        ),
        AnimeMovie(
            name: "Naruto",
            backgroundColor: .systemOrange,
            imageName: "naruto",
            details: """
    Naruto is a coming-of-age ninja adventure anime centered on Naruto Uzumaki, an energetic and determined young ninja who dreams of becoming the Hokage — the leader of his village. Born with the Nine-Tailed Fox demon sealed inside him, Naruto faces prejudice and loneliness from his peers, yet his unyielding optimism and determination push him to improve. The series explores his friendships, rivalries, and intense ninja battles, as well as deeper themes of perseverance, redemption, and finding one’s place in the world. Throughout his journey, Naruto learns powerful techniques like the Rasengan and Shadow Clone Jutsu, while forming unbreakable bonds with characters such as Sasuke Uchiha and Sakura Haruno. Combining heartfelt storytelling, well-choreographed fight scenes, and a memorable cast, Naruto became one of the most beloved shonen anime worldwide.
    """
        ),
        AnimeMovie(
            name: "Demon Slayer",
            backgroundColor: .black,
            imageName: "demonslayer",
            details: """
    Demon Slayer follows Tanjiro Kamado, a kind-hearted boy whose family is slaughtered by demons, leaving his younger sister Nezuko as the only survivor — though she is transformed into a demon herself. Determined to find a cure and avenge his family, Tanjiro joins the Demon Slayer Corps, an organization dedicated to eradicating demons. The anime is set in Taisho-era Japan and is known for its breathtaking animation, fluid sword-fighting sequences, and emotional storytelling. Each demon the protagonists face has a tragic backstory, creating a sense of empathy amidst the action. Themes of love, loss, perseverance, and humanity are woven throughout the narrative. The series' unique art style, vibrant colors, and powerful soundtrack have made it a standout in modern anime, while the brother-sister bond between Tanjiro and Nezuko remains at the heart of the story.
    """
        ),
        AnimeMovie(
            name: "One Piece",
            backgroundColor: .systemRed,
            imageName: "onepiece",
            details: """
    One Piece is an epic pirate adventure that follows Monkey D. Luffy, a cheerful and ambitious young pirate with the ability to stretch his body like rubber after eating the Gum-Gum Fruit. Luffy sets sail to find the legendary treasure known as the One Piece and become the King of the Pirates. Along the way, he gathers a diverse crew — the Straw Hat Pirates — each with unique dreams, abilities, and backstories. Known for its imaginative world-building, One Piece spans numerous islands, cultures, and political systems, blending comedy, drama, and high-stakes battles. The series often explores themes of friendship, loyalty, freedom, and chasing dreams despite overwhelming odds. With over a thousand episodes and an ongoing manga, One Piece has become a global phenomenon, beloved for its humor, emotional depth, and massive interconnected storyline.
    """
        ),
        AnimeMovie(
            name: "Death Note",
            backgroundColor: .darkGray,
            imageName: "deathnote",
            details: """
    Death Note is a psychological thriller anime revolving around Light Yagami, a brilliant high school student who discovers a mysterious notebook that grants him the power to kill anyone whose name he writes in it. Determined to cleanse the world of criminals, Light takes on the persona "Kira" and begins a crusade for what he believes is justice. However, his actions attract the attention of L, an eccentric but highly intelligent detective. What follows is a tense battle of wits, strategy, and morality between two geniuses. The anime raises deep philosophical questions about justice, morality, and the corrupting influence of power. With its intricate plot, suspenseful pacing, and morally gray characters, Death Note has become one of the most iconic and critically acclaimed anime worldwide, often serving as a gateway for newcomers to the medium.
    """
        ),
        AnimeMovie(
            name: "My Hero Academia",
            backgroundColor: .systemBlue,
            imageName: "mha",
            details: """
    My Hero Academia is set in a world where nearly everyone has a special power, known as a Quirk. The story follows Izuku Midoriya, a boy born without a Quirk, who still dreams of becoming the greatest hero. His life changes when he meets his idol, All Might, the world's number one hero, who passes on his Quirk, "One For All," to Izuku. Enrolling at U.A. High School, Izuku trains alongside his classmates to become a professional hero. The series blends superhero themes with shonen action, delivering thrilling battles, emotional character arcs, and lessons about responsibility, courage, and teamwork. Its diverse cast and inspirational message of perseverance have earned it global popularity, making it a staple of modern anime culture.
    """
        ),
        AnimeMovie(
            name: "Fullmetal Alchemist",
            backgroundColor: .brown,
            imageName: "fma",
            details: """
    Fullmetal Alchemist follows brothers Edward and Alphonse Elric, who use alchemy to try to resurrect their deceased mother — a forbidden act that results in Edward losing an arm and a leg, and Alphonse losing his entire body, his soul bound to a suit of armor. The two set out on a journey to find the Philosopher’s Stone, a powerful artifact that could restore their bodies. Along the way, they uncover a vast conspiracy involving the military, homunculi, and ancient truths about alchemy. The anime expertly weaves themes of sacrifice, morality, and the consequences of human ambition, all while delivering emotional storytelling and thrilling action sequences. Fullmetal Alchemist: Brotherhood, in particular, is hailed as one of the best anime series ever made for its tightly written plot and satisfying conclusion.
    """
        ),
        AnimeMovie(
            name: "Dragon Ball Z",
            backgroundColor: .systemYellow,
            imageName: "dbz",
            details: """
    Dragon Ball Z is one of the most influential shonen anime of all time, following the adventures of Goku and his friends as they defend Earth from powerful enemies. Known for its epic battles, iconic transformations like Super Saiyan, and memorable villains such as Frieza, Cell, and Majin Buu, DBZ combines martial arts with sci-fi and fantasy elements. The series emphasizes perseverance, self-improvement, and protecting loved ones. Its larger-than-life action scenes, emotional moments, and humor have made it a cultural phenomenon, inspiring generations of anime fans and countless adaptations, movies, and games.
    """
        ),
        AnimeMovie(
            name: "Bleach",
            backgroundColor: .systemIndigo,
            imageName: "bleach",
            details: """
    Bleach follows Ichigo Kurosaki, a teenager who gains the powers of a Soul Reaper after an encounter with Rukia Kuchiki. Tasked with protecting humans from evil spirits known as Hollows and guiding souls to the afterlife, Ichigo becomes involved in a vast spiritual conflict that spans multiple worlds. The series blends supernatural action, sword fights, and character-driven drama, with many iconic battles and a deep lore surrounding the Soul Society. Bleach's stylish character designs, memorable soundtrack, and mix of humor and intense storytelling have secured its place as one of the "Big Three" shonen anime alongside Naruto and One Piece.
    """
        ),
        AnimeMovie(
            name: "Jujutsu Kaisen",
            backgroundColor: .purple,
            imageName: "jujutsu",
            details: """
    Jujutsu Kaisen follows Yuji Itadori, a high school student who becomes host to a powerful cursed spirit after swallowing a dangerous talisman — the finger of Sukuna, the King of Curses. Joining the Tokyo Jujutsu High School, Yuji trains alongside sorcerers to combat malevolent curses and protect humanity. Known for its fluid and dynamic fight choreography, dark supernatural themes, and well-developed cast, Jujutsu Kaisen has rapidly risen in popularity. It masterfully blends horror, comedy, and heartfelt moments, with standout characters like Gojo Satoru and Nobara Kugisaki. Its high-quality animation and compelling storytelling have earned it critical and commercial acclaim worldwide.
    """
        ),
        AnimeMovie(
            name: "Tokyo Ghoul",
            backgroundColor: .systemTeal,
            imageName: "tokyoghoul",
            details: """
    Tokyo Ghoul is a dark fantasy anime that follows Ken Kaneki, a college student who becomes a half-ghoul after a near-fatal encounter with one of these flesh-eating creatures. Struggling to adapt to his new life, Kaneki is torn between his human morals and ghoul instincts. The anime explores themes of identity, survival, and morality in a brutal world where humans and ghouls coexist in constant tension. Known for its tragic storytelling, intense action, and haunting soundtrack, Tokyo Ghoul offers a deeply emotional journey, highlighting the pain of living between two worlds and the cost of trying to protect both.
    """
        ),
        AnimeMovie(
            name: "Hunter x Hunter",
            backgroundColor: .systemGreen,
            imageName: "hxh",
            details: """
    Hunter x Hunter follows Gon Freecss, a cheerful and determined boy who sets out to become a Hunter — a licensed professional who undertakes dangerous tasks — in hopes of finding his long-lost father. Along the way, he befriends Killua Zoldyck, Leorio, and Kurapika, each with their own goals and backstories. Known for its unpredictable storytelling, intricate power system (Nen), and morally complex characters, the series challenges shonen conventions. From lighthearted adventures to dark, psychological arcs, Hunter x Hunter is praised for its depth, world-building, and emotional impact, cementing its place as one of the greatest anime ever created.
    """
        )
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimeCell", for: indexPath) as! AnimeCollectionViewCell
        let anime = animeList[indexPath.item]
        
        cell.animeTitleLabel.text = anime.name
//        cell.animeTitleLabel.textColor = anime.backgroundColor
        cell.animeImageView.image = UIImage(named: anime.imageName)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedAnime = animeList[indexPath.row]

        if let detailVC = storyboard?.instantiateViewController(identifier: "DetailVC") as? DetailViewController {
            detailVC.anime = selectedAnime
//            navigationController?.pushViewController(detailVC, animated: true)
            present(detailVC, animated: true)

        }
    }
}
