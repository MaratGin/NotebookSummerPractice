import Foundation
import UIKit

class CalendarTableViewCell: UITableViewCell {
    
    // MARK: - UI elements

    var hour: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    var taskTimeEnd: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    var taskName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(hour)
        contentView.addSubview(taskName)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.taskName.text = ""
        self.backgroundColor = .none
    }
    
    func clear() {
        taskName.text = ""
        backgroundColor = .none
    }
    
    // MARK: - Constraints configuration

    func setConstraints() {
        hour.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(Constants.hourLeadingConstraint)
            make.top.equalToSuperview()
            make.width.equalTo(Constants.hourWidth).priority(Constants.hourWidthPriority)
            make.bottom.equalToSuperview()
        }
        taskName.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(Constants.taskNameTopInset)
            make.leading.equalTo(hour.snp.trailing).inset(Constants.taskNameLeadingInset).priority(Constants.taskNameLeadingPriority)
            make.bottom.equalToSuperview()
        }
    }
}

// MARK: - Constants

private struct Constants {
    static let hourLeadingConstraint = 15
    static let hourWidth = 80
    static let hourWidthPriority = 1000
    
    static let taskNameTopInset = 10
    static let taskNameLeadingInset = 10
    static let taskNameLeadingPriority = 500

}
