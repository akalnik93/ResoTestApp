import Foundation

protocol NetworkServiceProtcol {
    
    func fetchListOffices(completion: @escaping(Result<[Office], RTError>) -> Void)

}

class NetworkService: NetworkServiceProtcol {
    
    static let shared = NetworkService()
    
    func fetchListOffices(completion: @escaping(Result<[Office], RTError>) -> Void) {
        
        guard let url = URL(string: "https://mobile.reso.ru/free/v2/agencies/77") else {
            completion(.failure(.invalidUrlString))
            return
        }
        
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                      completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let jsonResults = try JSONDecoder().decode([Office].self, from: data)
                completion(.success(jsonResults))
            } catch {
                completion(.failure(.invalidData))
            }
        }.resume()
    }

}
