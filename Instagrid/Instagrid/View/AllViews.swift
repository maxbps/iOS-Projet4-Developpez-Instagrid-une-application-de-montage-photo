
import UIKit

class AllViews: UIView {

    @IBOutlet weak var MView: UIView!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var selected: UIImageView!
    @IBOutlet weak var selected2: UIImageView!
    @IBOutlet weak var selected3: UIImageView!
    
    enum Style {
        case topRectangle, bottomRectangle, fourSquares
    }
    
    var style: Style = .fourSquares {
        didSet {
            setStyle(style)
        }
    }
    
    private func setStyle(_ style: Style) {
        switch style {
        case .topRectangle:
            selected.isHidden = false
            selected2.isHidden = true
            selected3.isHidden = true
            button2.isHidden = true
            button4.isHidden = false

        case .bottomRectangle:
            selected.isHidden = true
            selected2.isHidden = false
            selected3.isHidden = true
            button4.isHidden = true
            button2.isHidden = false

        case .fourSquares:
            button2.isHidden = false
            button4.isHidden = false
            selected.isHidden = true
            selected2.isHidden = true
            selected3.isHidden = false
        }
    }
    
}
