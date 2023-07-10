import Foundation
import RealmSwift

// MARK: - Realm CRUD manager

class RealmManager {

    static let shared = RealmManager()
    let localRealm = try! Realm()
        
    func saveEvent(model: EventModel) {
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
    func getAllEvents() -> [EventModel] {
        let events = localRealm.objects(EventModel.self)
        return Array(events)
    }
    
    func deleteScheduleModel(model: EventModel) {
        try! localRealm.write {
            localRealm.delete(model)
        }
    }
}
