//
//  Netwoking.swift
//  Gamee
//
//  Created by Christianto Budisaputra on 27/08/21.
//

import Foundation

struct NetworkingHelper {
    typealias Callback<T> = ((Result<T, Error>) -> Void)

    static func get<T: Decodable>(type: T.Type, url: String, completion: @escaping Callback<T>) {
        var urlComponents = URLComponents(string: url)!

        urlComponents.queryItems = [
            URLQueryItem(name: "key", value: Networking.apiKey)
        ]

        URLSession.shared.dataTask(with: urlComponents.url!) { data, res, _ in
            guard let data = data,
                  let res = res as? HTTPURLResponse,
                  res.statusCode == 200 else { return }

            do {
                let result = try JSONDecoder().decode(T.self, from: data)

                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }

        }.resume()
    }
}
