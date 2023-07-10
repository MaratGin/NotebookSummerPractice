import Foundation
import UIKit

class DatePickerTableViewCell: UITableViewCell {

    // MARK: - Cell identifier

    static let identifier = "DatePickerTableViewCell"

    // MARK: - Variables
    
    var position: Int = 1
    var buttonClicked: (() -> (Void))!
    
    // MARK: - UI elements

    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Edit me"
        return textField
    }()
    
    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        return datePicker
    }()
    
    var cellBackgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    var container: UIView = {
       let view = UIView()
        view.backgroundColor = .none
        return view
    }()
    
    let dayButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.backgroundColor = Constants.buttonColor
        button.setTitle("\(DateConfigurator.configureCurrentDate())", for: .normal)
        return button
    }()
    let hourButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Constants.buttonColor
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("\(DateConfigurator.configureHour(offset: 0))", for: .normal)
        return button
    }()
    
    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = Constants.backgroundColor
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(container)
        container.addSubview(nameLabel)
        container.addSubview(datePicker)
        setConstraints()
        textField.frame = bounds
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
            make.leading.trailing.equalToSuperview().inset(Constants.cellBackgroundTrailingInset)
        }
        container.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(Constants.nameLabelLeadingInset)
            make.width.equalTo(Constants.nameLabelWidth)
        }
        datePicker.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.trailing)
            make.trailing.equalToSuperview().inset(Constants.datePickerTrailingInset)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(Constants.datePickerWidthCoef)
        }
    }
}

// MARK: - Constants

private struct Constants {
    static let cellBackgroundTrailingInset = 10
    
    static let nameLabelLeadingInset = 15
    static let nameLabelWidth = 60
    
    static let datePickerTrailingInset = 15
    static let datePickerWidthCoef = 0.6
    
    static let backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.0)
    static let buttonColor = UIColor(red: 0.9, green: 0.9, blue: 0.92, alpha: 1.0)
}
