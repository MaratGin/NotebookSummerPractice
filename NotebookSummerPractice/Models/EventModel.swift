import Foundation
import RealmSwift

// MARK: - Event Realm model

class EventModel: Object {
    @Persisted var id = 0
    @Persisted var date_start: Date?
    @Persisted var date_finish: Date?
    @Persisted var name: String = ""
    @Persisted var desc: String = ""
}
