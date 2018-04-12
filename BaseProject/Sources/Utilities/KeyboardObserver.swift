//
//  Copyright (C) Nakayasu Yuichi All rights reserved.
//
import UIKit

protocol KeyboardObserverDelegate: class {
    
    func keyboardObserver(_ observer: KeyboardObserver, willChangeKeyboardPosition y: CGFloat)
}

class KeyboardObserver: NSObject {
    
    weak var delegate: KeyboardObserverDelegate?
    
    private var keyboardY = CGFloat.nan
    
    /// 監視する通知
    private let notificationNames: [Notification.Name] = [
        .UIKeyboardWillChangeFrame,
        .UIKeyboardWillShow,
        .UIKeyboardWillHide,
    ]
    
    init(delegate: KeyboardObserverDelegate? = nil) {
        super.init()
        self.delegate = delegate
        ovserveKeyboardEvents()
    }
    
    private func ovserveKeyboardEvents() {
        notificationNames.forEach { name in
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(didNotifyKeyboardEvent(_:)),
                name: name,
                object: nil
            )
        }
    }
    
    @objc private func didNotifyKeyboardEvent(_ notification: Notification) {
        guard
            let userInfo   = notification.userInfo,
            let beginFrame = userInfo[UIKeyboardFrameBeginUserInfoKey] as? CGRect,
            let endFrame   = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect,
            let curve      = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber,
            let duration   = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval
            else {
                return
        }
        
        if keyboardY.isNaN {
            keyboardY = beginFrame.minY
        }
        if keyboardY == endFrame.minY {
            return
        }
        keyboardY = endFrame.minY
        
        print(endFrame.minY, endFrame.height, UIScreen.main.bounds.height, endFrame.minY + endFrame.height)
        
        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: UIViewAnimationOptions(rawValue: UInt(truncating: curve)),
            animations: { [weak self] in
                self!.delegate?.keyboardObserver(self!, willChangeKeyboardPosition: self!.keyboardY)
            },
            completion: { _ in }
        )
    }
}
