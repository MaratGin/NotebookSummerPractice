import Foundation

import UIKit

class AddNewEventViewController: UITableViewController {
    
    // MARK: - Identifier
    
    let reuseIdentidier = "addNewEventCell"
    
    
    // MARK: - variables
    
    var sections: [[String]] = Constants.sections
    

    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        tableView.register(AddNewEventTableViewCell.self, forCellReuseIdentifier: reuseIdentidier)
        tableView.register(AddNewEventTextViewCell.self, forCellReuseIdentifier: AddNewEventTextViewCell.identifier)
        tableView.register(DatePickerTableViewCell.self, forCellReuseIdentifier: DatePickerTableViewCell.identifier)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 10)
        navigationController?.navigationBar.tintColor = UIColor(red: 0.35, green: 0.78, blue: 0.98, alpha: 1.0)
        title = Constants.title
        navigationItem.leftBarButtonItem? = UIBarButtonItem(title: "week", style: .done, target: self, action: #selector(showMonth))
        navigationItem.rightBarButtonItem? = UIBarButtonItem(title: "add",style: .done, target: self, action: #selector(addNewEvent))
    }
    
    // MARK: - Buttons actions

    @objc
    func showMonth() {
    }
    
    @objc
    func addNewEvent() {
    }
    
    // MARK: - UITableViewController override methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0: return 2
        case 1: return 2
        default: return 3
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if [indexPath.section : indexPath.row] == [0 : 1] {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AddNewEventTextViewCell.identifier), for: indexPath) as! AddNewEventTextViewCell
            cell.descTextView.placeholderLabel.text = sections[0][1]
            cell.reDraw()
            return cell
        } else  if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DatePickerTableViewCell.identifier), for: indexPath) as! DatePickerTableViewCell
            cell.nameLabel.text = sections[1][indexPath.row]
            cell.position = indexPath.row
            cell.reDraw()
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: reuseIdentidier), for: indexPath) as! AddNewEventTableViewCell
            print(indexPath.section, indexPath.row)
            cell.nameTextField.placeholder = sections[indexPath.section][indexPath.row]
            cell.position = indexPath.row
            cell.reDraw()
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return [indexPath.section : indexPath.row] == [0 : 1] ? 200 : view.frame.size.height / 18
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(Constants.spaceBetweenSections)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return " "
        case 1: return " "
        case 2: return " "
        default: return " "
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

private struct Constants {
    static let spaceBetweenSections = 25
    static let sections = [["Название", "Описание"],["Начало", "Конец"]]
    static let title = "Add new Event"
}
