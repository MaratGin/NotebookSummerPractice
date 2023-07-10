import UIKit
import SnapKit
import FSCalendar

class MainCalendarViewController: UIViewController {
    
    // MARK: - identifiers

    let cellIdentifier = "calendarTableViewCell"
    let viewControllerIdentifier = "eventDetailViewController"

    // MARK: - Variables

    var data: [EventModel] = []
    var hours: [String] = Constants.hours
   
    // MARK: - Presenter

    var presenter: MainCalendarPresenterProtocol!
    
    // MARK: - UI elements

    @IBOutlet weak var leftBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var rightBarButtonItem: UIBarButtonItem!
    @IBOutlet private weak var calendar: FSCalendar! = {
        let calendar = FSCalendar()
        return calendar
    }()
    @IBOutlet weak var tableView: UITableView!
    var calendarHeightConstraint: NSLayoutConstraint!
    
    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainCalendarPresenter()
        data = presenter.getTodaysEvents()
        view.addSubview(calendar)
        title = "Schedule"
        calendar.dataSource = self
        calendar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        calendarHeightConstraint = NSLayoutConstraint(
            item: calendar ?? FSCalendar(),
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 300)
        calendar.addConstraint(calendarHeightConstraint)
        navigationItem.leftBarButtonItem? = UIBarButtonItem(title: "week", style: .done, target: self, action: #selector(showMonth))
        navigationItem.leftBarButtonItem?.tintColor = .black
        tableView.register(CalendarTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    // MARK: - Buttons actions

    @IBAction func presentNewEvent(_ sender: Any) {
        performSegue(withIdentifier: "newEventID", sender: nil)
        
    }
    @objc
    func addNewEvent() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "addNewEventId") as! AddNewEventViewController
        self.present(secondViewController, animated: true, completion: nil)
    }
        
    @objc
    func showMonth() {
        if calendar.scope == .week {
            calendar.setScope(.month, animated: true)
            navigationItem.leftBarButtonItem?.title = "week"
            
            
        } else {
            calendar.setScope(.week, animated: true)
            navigationItem.leftBarButtonItem?.title = "month"
        }
    }
    
    // MARK: - Constraints configuration
    
    func setConstraints() {
        calendar.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
        }
    }
}

// MARK: - FSCalendarDataSource, FSCalendarDelegate

extension MainCalendarViewController: FSCalendarDataSource, FSCalendarDelegate {
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeightConstraint.constant = bounds.height
        view.layoutIfNeeded()
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if calendar.scope == .month {
            calendar.setScope(.week, animated: true)
        }
        data.removeAll()
        data = presenter.getSpecificDayEvents(date: date)
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension MainCalendarViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CalendarTableViewCell
        cell.hour.text = hours[indexPath.row]
        if data[indexPath.row].id != 0 {
            cell.taskName.text = data[indexPath.row].name
            cell.taskName.backgroundColor = UIColor(red: 0.35, green: 0.78, blue: 0.98, alpha: 1.0)
        } else {
            cell.clear()
            cell.taskName.text = ""
            cell.taskName.backgroundColor = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hours.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if data[indexPath.row].id != 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier) as? EventDetailViewController {
                viewController.text1 = data[indexPath.row].name
                viewController.text2 = ((data[indexPath.row].date_start?.get(.hour).description ?? "") + ":00")
                viewController.text3 = ((data[indexPath.row].date_finish?.get(.hour).description ?? "") + ":00")
                viewController.text4 = data[indexPath.row].desc
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        } else {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

private struct Constants {
    static let hours = ["00:00","01:00","02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00","12:00", "13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00"]
}
