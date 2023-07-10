import Foundation

// MARK: MainCalendarPresenterProtocol

protocol MainCalendarPresenterProtocol {
    func fetchData() -> [EventModel]
    func getTodaysEvents() -> [EventModel]
    func getSpecificDayEvents(date: Date) -> [EventModel]
}

class MainCalendarPresenter: MainCalendarPresenterProtocol {
    
    // MARK: -  Variables
    
    var fetchService: FetchDataFromJSON
    var realmManager: RealmManager
    
    // MARK: -  Init

    init() {
        fetchService = FetchDataFromJSON()
        realmManager = RealmManager()
    }
    
    // MARK: - Data fetching methods

    func fetchData() -> [EventModel] {
        let data = fetchService.readFile(forName: Constants.path) ?? Data()
        let recievedData = fetchService.parse(jsonData: data)
        var array: [EventModel] = []
        print(recievedData.description)
        recievedData.forEach { element in
            let model = EventModel()
            
            guard let id = element.id,
                  let name = element.name,
                  let date_start = element.date_start,
                  let date_finish = element.date_finish,
                  let desc = element.description else {
                
                return
            }
            
            model.id = id
            model.name = name
            model.desc = desc
            model.date_start = Date(timeIntervalSince1970: Double(date_start) ?? 0)
            model.date_finish = Date(timeIntervalSince1970: Double(date_finish) ?? 0)
            
            RealmManager.shared.saveEvent(model: model)
            array.append(model)
        }
        return array
    }
    
    func getTodaysEvents() -> [EventModel] {
        let events = RealmManager.shared.getAllEvents()
        var array = Array(repeating: EventModel(), count: 24)
        events.filter { event in
            if Date().get(.day) == event.date_start?.get(.day),
               Date().get(.month) == event.date_start?.get(.month),
               Date().get(.year) == event.date_start?.get(.year) {
                for i in (event.date_start?.get(.hour) ?? 0)..<(event.date_finish?.get(.hour)  ?? 0) {
                    array[i] = event
                }
                return true
            } else {
                return false
            }
        }
        return array
    }

    func getSpecificDayEvents(date: Date) -> [EventModel] {
        let events = RealmManager.shared.getAllEvents()
        var array = Array(repeating: EventModel(), count: 24)
        events.filter { event in
            if date.get(.day) == event.date_start?.get(.day),
               date.get(.month) == event.date_start?.get(.month),
               date.get(.year) == event.date_start?.get(.year) {
                for i in (event.date_start?.get(.hour) ?? 0)..<(event.date_finish?.get(.hour)  ?? 0) {
                    array[i] = event
                }
                return true
                
            } else {
                return false
            }
        }

        return array
    }
}

// MARK: - Constants

private struct Constants {
    
    static let path = "/Users/maratik/Desktop/SwiftProjects/NotebookSummerPractice/NotebookSummerPractice/Services/data.json"
}
