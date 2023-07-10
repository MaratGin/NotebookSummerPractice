import Foundation

class DateConfigurator {
    
    // MARK: - Date configuration

    static func configureCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateStyle = .medium
        let string = dateFormatter.string(from: Date())
        return string
    }
    static func configureDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateStyle = .long
        let string = dateFormatter.string(from: date)
        return string
    }
    
    static func configureHour(offset: Int) -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        return "\(hour):00"
    }
}

// MARK: - Date patterns

/*
formatdate("Mdyyyy") // "1/2/1984"
formatdate("yyyyMMdd") // "01/02/1984"
formatdate("yyyyMMMdd") // "Jan 02, 1984"
formatdate("yyyyMMMMdd") // "January 02, 1984"
formatdate("yyyyMMMMMdd") // "J 02, 1984"
formatdate("yyyyG") // "1984 AD"
formatdate("yyyyGGGG") // "1984 Anno Domini"
formatdate("yyyyMMMddE") // "Mon, Jan 02, 1984"
formatdate("yyyyMMMddEEEE") // "Monday, Jan 02, 1984"
formatdate("yyyyMMMddEEEEE") // "M, Jan 02, 1984"

formatdate("MdYYYY") // "1/2/1984"
formatdate("YYYYMMdd") // "01/02/1984"
formatdate("YYYYMMMdd") // "Jan 02, 1984"
formatdate("YYYYMMMMdd") // "January 02, 1984"
formatdate("YYYYMMMMMdd") // "J 02, 1984"
formatdate("YYYYG") // "1984 AD"
formatdate("YYYYGGGG") // "1984 Anno Domini"
formatdate("YYYYMMMddE") // "Mon, Jan 02, 1984"
formatdate("YYYYMMMddEEEE") // "Monday, Jan 02, 1984"
formatdate("YYYYMMMddEEEEE") // "M, Jan 02, 1984"
*/
