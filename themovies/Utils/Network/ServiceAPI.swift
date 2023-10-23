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
    func nowPlaying(page: Int, completion: @escaping((Result<ContentResult, APIError>) -> Void))
    func popularMovie(page: Int, completion: @escaping((Result<ContentResult, APIError>) -> Void))
    func popularSerie(page: Int, completion: @escaping((Result<ContentResult, APIError>) -> Void))
    func getOnAirSerie(page: Int, completion: @escaping((Result<ContentResult, APIError>) -> Void))
}

class ServiceAPI: MovieProvider {
    private let baseUrl: String = "https://api.themoviedb.org/3"
    private let apiKey: String = "?api_key=e6a0bb4b36db22f170511e1bd3b86e5a"
    
    private enum APIPath {
        case nowPlaying
        case popular
        case popularSerie
        case onAirSerie
        
        var path: String {
            switch self {
            case .nowPlaying:
                return "/movie/now_playing"
            case .popular:
                return "/movie/popular"
            case .popularSerie:
                return "/tv/top_rated"
            case .onAirSerie:
                return "/tv/airing_today"
            }
        }
    }
    
    private enum Method {
        case GET
    }
    
    func nowPlaying(page: Int, completion: @escaping((Result<ContentResult, APIError>) -> Void)) {
        configRequest(page: page, endpoint: .nowPlaying, completion: completion)
    }
    
    func popularMovie(page: Int, completion: @escaping ((Result<ContentResult, APIError>) -> Void)) {
        configRequest(page: page, endpoint: .popular, completion: completion)
    }
    
    func popularSerie(page: Int, completion: @escaping ((Result<ContentResult, APIError>) -> Void)) {
        configRequest(page: page, endpoint: .popularSerie, completion: completion)
    }
    
    func getOnAirSerie(page: Int, completion: @escaping ((Result<ContentResult, APIError>) -> Void)) {
        configRequest(page: page, endpoint: .onAirSerie, completion: completion)
    }
    
    private func configRequest<T:Codable>(page: Int? = nil, endpoint: APIPath, method: Method = .GET, completion: @escaping((Result<T, APIError>) -> Void)) {
        let path = "\(baseUrl)\(endpoint.path)"
        let language = Locale.current.languageCode == "pt" ? "pt-Br" : "en-US"
        var urlComponents = URLComponents(string: path)
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: "e6a0bb4b36db22f170511e1bd3b86e5a"),
            URLQueryItem(name: "language", value: language)
        ]
        
        if let pageNum = page {
            urlComponents?.queryItems?.append(URLQueryItem(name: "page",
                                                           value: "\(pageNum)"))
        }
        
        guard let url = urlComponents?.url else {
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
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let object = try decoder.decode(T.self, from: data)
                completion(.success(object))
            } catch {
                completion(.failure(.parsingError))
            }
        }
        dataTask.resume()
    }
}
