//
//  ServiceAPI.swift
//  themovies
//
//  Created by Luis Domingues on 14/05/23.
//

import Foundation

protocol ServiceAPIProtocol {
    func getMovies(completionHandler: @escaping (Result<Movie, Error>) -> Void)
}

class ServiceAPI: ServiceAPIProtocol {
    private let apiUrl: String = "https://api.themoviedb.org/3/movie/now_playing?api_key=e6a0bb4b36db22f170511e1bd3b86e5a"
    //private let apiKey: String = "e6a0bb4b36db22f170511e1bd3b86e5a"

    func getMovies(completionHandler: @escaping (Result<Movie, Error>) -> Void) {
        let url: URL = URL(string: apiUrl)!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
              print("Error with fetching films: \(error)")
              return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
              print("Error with the response, unexpected status code: \(response)")
              return
            }

            if let data = data,
              let filmSummary = try? JSONDecoder().decode(Movie.self, from: data) {
                completionHandler(.success(filmSummary))
            }
        }
        
        task.resume()
    }
}
