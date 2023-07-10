import Foundation

import UIKit

class EventDetailViewController: UIViewController {
    
    // MARK: - Identifier

    let reuseIdentidier = "eventDetailViewController"
    
    // MARK: - UI elements
    
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Variables

    var text1: String = ""
    var text2: String = ""
    var text3: String = ""
    var text4: String = ""
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = text1
        startLabel.text = text2
        endLabel.text = text3
        descriptionLabel.text = text4
    }
}
