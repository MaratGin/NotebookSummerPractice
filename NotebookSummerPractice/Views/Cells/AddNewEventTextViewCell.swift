import Foundation
import UIKit

class AddNewEventTextViewCell: UITableViewCell {
    
    // MARK: - Cell identifier

    static let identifier = "AddNewEventTextViewCell"

    // MARK: - Variables

    var position: Int = 1
    
    // MARK: - UI elements

    var descTextView: CustomTextView = {
        let textField = CustomTextView()
        return textField
    }()
    
    var placeholderLabel : UILabel!
    
    var cellBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    
    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(descTextView)
        cellBackgroundView.bringSubviewToFront(descTextView)
        setConstraints()
        layoutSubviews()
        backgroundColor = Constants.backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    // MARK: - Constraints configuration

    func setConstraints() {
        cellBackgroundView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(Constants.cellBackgroundLeadingInset)
        }
        descTextView.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
            make.leading.equalToSuperview().inset(Constants.descTextViewLeadingInset)
        }
    }
}

// MARK: - Constants

private struct Constants {
    static let cellBackgroundLeadingInset = 10
    
    static let descTextViewLeadingInset = 14

    static let backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.0)
    static let buttonColor = UIColor(red: 0.9, green: 0.9, blue: 0.92, alpha: 1.0)
}
