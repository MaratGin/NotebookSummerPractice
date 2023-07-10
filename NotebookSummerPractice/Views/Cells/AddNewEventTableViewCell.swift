import Foundation
import UIKit

class AddNewEventTableViewCell: UITableViewCell {
    
    // MARK: - variables

    var position: Int = 1
    
    // MARK: - UI elements

    @IBOutlet weak var textField: UITextView!
    
    var nameTextField: UITextField = {
        let textField = UITextField()
        textField.sizeToFit()
        textField.contentVerticalAlignment = .top
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var cellBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = Constants.cellBackgroundViewCornerRadius
        view.clipsToBounds = true
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    
    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        separatorInset = Constants.separatorInset
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(nameTextField)
        cellBackgroundView.bringSubviewToFront(nameTextField)
        setConstraints()
        layoutSubviews()
        nameTextField.delegate = self
        backgroundColor = Constants.backgroundColor
    }
    
    // MARK: - Method for rounding circles

    func reDraw() {
        if position == 1 {
            cellBackgroundView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
        if position == 0 {
            cellBackgroundView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints configuration

    func setConstraints() {
        cellBackgroundView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(Constants.cellBackgroundViewTrailingInset)
        }
        nameTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(Constants.nameTextFieldLeadingInset)
            make.trailing.equalTo(cellBackgroundView.snp.trailing)
            make.center.equalToSuperview()
        }
    }
}

// MARK: - UITextFieldDelegate

extension AddNewEventTableViewCell: UITextFieldDelegate {
}

// MARK: - Constants

private struct Constants {
    static let cellBackgroundViewCornerRadius = 10.0
    static let backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.0)
    static let separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 10)
    
    static let cellBackgroundViewTrailingInset = 10
    
    static let nameTextFieldLeadingInset = 15
}
