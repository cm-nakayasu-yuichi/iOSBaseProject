//
//  Copyright (C) Nakayasu Yuichi All rights reserved.
//
import UIKit

// ボタン種類の定義はこちら
// =============================================================================
enum ButtonKind: String {
    case commit
}

// 各ボタン種類による表示の定義はこちら
// =============================================================================
extension ButtonKind {
    
    var normalColor: UIColor {
        switch self {
        case .commit: return #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        }
    }
    
    var highlightedColor: UIColor {
        switch self {
        case .commit: return #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        }
    }
    
    var disabledColor: UIColor {
        switch self {
        case .commit: return #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        }
    }
    
    var textColor: UIColor {
        switch self {
        default: return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    var disabledTextColor: UIColor {
        switch self {
        default: return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
    }
    
    var borderColor: UIColor {
        switch self {
        default: return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
    }
    
    var borderWidth: CGFloat {
        switch self {
        default: return 2
        }
    }
    
    var cornerRadius: CGFloat {
        switch self {
        default: return 5
        }
    }
}
// =============================================================================

@IBDesignable class Button: UIButton {
    
    @IBInspectable var kind: String = ButtonKind.commit.rawValue {
        didSet {
            layer.cornerRadius = buttonKind.cornerRadius
            layer.borderWidth = buttonKind.borderWidth
            layer.borderColor = buttonKind.borderColor.cgColor
            
            backgroundColor = buttonKind.normalColor
            
            setTitleColor(buttonKind.textColor, for: .normal)
            setTitleColor(buttonKind.textColor, for: .highlighted)
            setTitleColor(buttonKind.disabledTextColor, for: .disabled)
            
            titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        }
    }
    
    private var buttonKind: ButtonKind {
        return ButtonKind(rawValue: kind) ?? .commit
    }
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                backgroundColor = buttonKind.normalColor
            } else {
                backgroundColor = buttonKind.disabledColor
            }
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                backgroundColor = buttonKind.highlightedColor
            } else {
                UIView.animate(withDuration: 0.2, animations: { [unowned self] in
                    self.backgroundColor = self.buttonKind.normalColor
                })
            }
        }
    }
}
