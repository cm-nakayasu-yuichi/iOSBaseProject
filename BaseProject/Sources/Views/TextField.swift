//
//  Copyright (C) Nakayasu Yuichi All rights reserved.
//
import UIKit

@IBDesignable class TextField: UITextField {
    
    /// アンラップされた文字列
    var textValue: String {
        return text ?? ""
    }
    
    /// アンラップされた属性付き文字列
    var attributedTextValue: NSAttributedString {
        return attributedText ?? NSAttributedString(string: "")
    }
    
    /// プレースホルダ色
    @IBInspectable var placeholderColor: UIColor? {
        get {
            var range: NSRange? = NSMakeRange(0, 1)
            guard
                let ap = attributedPlaceholder,
                let ret = ap.attribute(.foregroundColor, at: 0, effectiveRange: &range!) as? UIColor
                else {
                    return nil
            }
            return ret
        }
        set {
            guard
                let color = newValue,
                let font = font
                else {
                    return
            }
            let attributes: [NSAttributedStringKey : Any] = [
                .foregroundColor : color,
                .font            : font,
                ]
            let placeholder = self.placeholder ?? ""
            attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        }
    }
}
