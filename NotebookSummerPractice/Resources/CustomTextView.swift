import Foundation
import UIKit

class CustomTextView: UITextView {
    
    var placeholderLabel : UILabel!

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        delegate = self
        placeholderLabel = UILabel()
        placeholderLabel.text = "Enter some text..."
        placeholderLabel.font = .systemFont(ofSize: 17)
        placeholderLabel.sizeToFit()
        addSubview(placeholderLabel)
        placeholderLabel.frame.origin = CGPoint(x: 0, y: 8)
        placeholderLabel.textColor = UIColor(red: 0.78, green: 0.78, blue: 0.8, alpha: 1.0)
        placeholderLabel.isHidden = !text.isEmpty
        textContainerInset = UIEdgeInsets(top: 5, left: -4, bottom: 0, right: 0)
        font = .systemFont(ofSize: 17)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomTextView : UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel?.isHidden = !textView.text.isEmpty
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        placeholderLabel?.isHidden = !textView.text.isEmpty
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        placeholderLabel?.isHidden = true
    }
}
