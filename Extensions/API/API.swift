//
//  API.swift
//  Extensions
//
//  Created by R on 2024/08/05.
//  Copyright © 2024 マック太郎. All rights reserved.
//

import Foundation

protocol API {
    associatedtype Response: Decodable
    var url: String { get }
    var params: [String: String] { get }
    var mothod: String { get }
    func request() async throws -> Response
}

extension API {
    func request() async throws -> Response {
        var urlComponents = URLComponents(string: url)!
        if mothod == "GET" {
            urlComponents.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = mothod
        if mothod != "GET" {
            request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        }
        do {
            let task = try await URLSession.shared.data(for: request)
            let response = try JSONDecoder().decode(Response.self, from: task.0)
            guard let urlResponse = task.1 as? HTTPURLResponse else {
                throw APIError.noResponse
            }
            guard 200 ..< 300 ~= urlResponse.statusCode else {
                throw APIError.staus(urlResponse.statusCode)
            }
            return response

        } catch {
            throw APIError.other(error)
        }
    }
}

enum APIError: Error {
    case noResponse
    case staus(Int)
    case other(Error)
}
