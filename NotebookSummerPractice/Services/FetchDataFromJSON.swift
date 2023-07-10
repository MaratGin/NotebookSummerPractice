import Foundation

//MARK: - Fetch data from JSON file

class FetchDataFromJSON {
    
    func readFile(forName path: String) -> Data? {
        do {
            if let jsonData = try String(contentsOfFile: path).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    func parse(jsonData: Data) -> [EventModelDTO] {
        do {
            let decodedData = try JSONDecoder().decode([EventModelDTO].self,
                                                       from: jsonData)
            return decodedData
        } catch {
            print(error)
            return [EventModelDTO()]
        }
    }
}


