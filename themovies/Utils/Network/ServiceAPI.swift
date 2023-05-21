//
//  ServiceAPI.swift
//  themovies
//
//  Created by Luis Domingues on 14/05/23.
//

import Foundation

enum APIError: Error {
    case generic
    case parsingError
}

protocol MovieProvider {
    func nowPlaying(completion: @escaping((Result<Movie, APIError>) -> Void))
    func popularMovie(completion: @escaping((Result<Movie, APIError>) -> Void))
}

class ServiceAPI: MovieProvider {
    private let baseUrl: String = "https://api.themoviedb.org/3/movie"
    private let apiKey: String = "<<APIKEY>>"
    
    private enum APIPath {
        case nowPlaying
        case popular
        
        var path: String {
            switch self {
            case .nowPlaying:
                return "/now_playing"
            case .popular:
                return "/popular"
            }
        }
    }
    
    private enum Method {
        case GET
    }
    
    func nowPlaying(completion: @escaping((Result<Movie, APIError>) -> Void)) {
        configRequest(endpoint: .nowPlaying, completion: completion)
    }
    
    func popularMovie(completion: @escaping ((Result<Movie, APIError>) -> Void)) {
        configRequest(endpoint: .popular, completion: completion)
    }
    
    private func configRequest<T:Codable>(endpoint: APIPath, method: Method = .GET, completion: @escaping((Result<T, APIError>) -> Void)) {
        let path = "\(baseUrl)\(endpoint.path)\(apiKey)"
        
        guard let url = URL(string: path) else {
            completion(.failure(.generic))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "\(method)"
        request.allHTTPHeaderFields = ["Content-Type":"application/json"]
        makeCall(with: request, completion: completion)
    }
    
    private func makeCall<T: Codable>(with request: URLRequest, completion: @escaping((Result<T, APIError>) -> Void)) {
        let dataTask = URLSession.shared.dataTask(with: request) { data, resp, error in
            guard error == nil else {
                completion(.failure(.generic))
                return
            }
            
            do {
                guard let data = data else {
                    completion(.failure(.generic))
                    return
                }
                let object = try JSONDecoder().decode(T.self, from: data)
                completion(.success(object))
            } catch {
                completion(.failure(.parsingError))
            }
        }
        dataTask.resume()
    }
}
