//
//  NetworkManager.swift
//  MoviesHub
//
//  Created by MacBook Pro on 21/12/2025.
//

import Foundation


// Infrastructure/Network/APIClient.swift
class APIClient {
    static let shared = APIClient()
    
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(session: URLSession = .shared) {
        self.session = session
        self.decoder = JSONDecoder()
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    // MARK: - Main Request Method
    
    func request<T: Decodable>(
        _ endpoint: Endpoint,
        method: HTTPMethod = .get,
        body: Encodable? = nil,
        headers: [String: String]? = nil
    ) async throws -> T {
        // Build request
        let request = try buildRequest(endpoint: endpoint, method: method, body: body, headers: headers)
        
        // Log request
        logRequest(request)
        
        do {
            // Perform request
            let (data, response) = try await session.data(for: request)
            
            // Log response
            logResponse(data: data, response: response, error: nil)
            
            // Validate response
            try validateResponse(response)
            
            // Decode
            
//            let homeListing = try JSONDecoder().decode(HomeListingDTO.self, from: data)
//            homeListing.results?.forEach {
//                print("id: \($0.id), posterPath: \($0.posterPath ?? "nil"), voteAverage: \($0.voteAverage ?? -1)")
//            }
            
            let decoded = try JSONDecoder().decode(T.self, from: data)
            
            print("✅ Successfully decoded \(T.self)")
            
            return decoded
            
        } catch {
            // Log error
            logResponse(data: nil, response: nil, error: error)
            throw error
        }
    }
    
    // MARK: - Build Request
    
    private func buildRequest(
        endpoint: Endpoint,
        method: HTTPMethod,
        body: Encodable?,
        headers: [String: String]?
    ) throws -> URLRequest {
        var request = URLRequest(url: endpoint.url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = 30
        
        // Default headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        // Add custom headers
        headers?.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        // Add body if present
        if let body = body {
            request.httpBody = try JSONEncoder().encode(body)
        }
        
        return request
    }
    
    // MARK: - Validate Response
    
    private func validateResponse(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw APIError.httpError(statusCode: httpResponse.statusCode)
        }
    }
    
    // MARK: - Logging
    
    private func logRequest(_ request: URLRequest) {
        print("\n🚀 ========== API REQUEST ==========")
        print("📍 URL: \(request.url?.absoluteString ?? "N/A")")
        print("🔧 Method: \(request.httpMethod ?? "N/A")")
        
        // Headers
        if let headers = request.allHTTPHeaderFields, !headers.isEmpty {
            print("📋 Headers:")
            headers.forEach { key, value in
                print("   \(key): \(value)")
            }
        }
        
        // Body
        if let body = request.httpBody,
           let bodyString = String(data: body, encoding: .utf8) {
            print("📦 Body:")
            print(bodyString.prettyPrintedJSON ?? bodyString)
        }
        
        print("⏰ Timestamp: \(Date())")
        print("===================================\n")
    }
    
    private func logResponse(data: Data?, response: URLResponse?, error: Error?) {
        print("\n📥 ========== API RESPONSE ==========")
        
        if let error = error {
            print("❌ Error: \(error.localizedDescription)")
            print("=====================================\n")
            return
        }
        
        // HTTP Response
        if let httpResponse = response as? HTTPURLResponse {
            let statusEmoji = (200...299).contains(httpResponse.statusCode) ? "✅" : "❌"
            print("\(statusEmoji) Status Code: \(httpResponse.statusCode)")
            print("📍 URL: \(httpResponse.url?.absoluteString ?? "N/A")")
            
            // Response Headers
            print("📋 Headers:")
            httpResponse.allHeaderFields.forEach { key, value in
                print("   \(key): \(value)")
            }
        }
        
        // Response Data
        if let data = data {
            print("📦 Response Size: \(ByteCountFormatter.string(fromByteCount: Int64(data.count), countStyle: .binary))")
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print("📄 Response Body:")
                print(jsonString.prettyPrintedJSON ?? jsonString)
            }
        }
        
        print("⏰ Timestamp: \(Date())")
        print("=====================================\n")
    }
}


// MARK: - HTTP Method

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

// MARK: - API Error

enum APIError: LocalizedError {
    case invalidURL
    case invalidResponse
    case httpError(statusCode: Int)
    case decodingError(Error)
    case networkError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response from server"
        case .httpError(let statusCode):
            return "HTTP Error: \(statusCode)"
        case .decodingError(let error):
            return "Decoding Error: \(error.localizedDescription)"
        case .networkError(let error):
            return "Network Error: \(error.localizedDescription)"
        }
    }
}

extension String {
    var prettyPrintedJSON: String? {
        guard let data = self.data(using: .utf8),
              let json = try? JSONSerialization.jsonObject(with: data),
              let prettyData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
              let prettyString = String(data: prettyData, encoding: .utf8) else {
            return nil
        }
        return prettyString
    }
}
