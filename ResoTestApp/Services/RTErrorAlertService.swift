import UIKit

enum RTError: String, Error {

    case invalidData = "Данные, полученные с сервера, недействительны. Пожалуйста, повторите попытку."
    case invalidResponse = "Недействительный ответ с сервера. Пожалуйста, повторите попытку."
    case unableToComplete = "Невозможно выполнить запрос. Пожалуйста, проверьте интернет соединение."
    case invalidUrlString = "Недействительный адрес запроса. Пожалуйста, повторите попытку."

}

class RTErrorAlertService {
    
    static var shared = RTErrorAlertService()
    
    func getAlertWithError(_ error: RTError) -> UIAlertController {
        let alertController = UIAlertController.init(title: error.rawValue, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .cancel)
        alertController.addAction(action)
        return alertController
    }
    
}
