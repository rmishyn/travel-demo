//
//  Data+Extension.swift
//  Travel
//
//  Created by Ruslan Mishyn on 11.06.2024.
//

import Foundation

extension Data {
    
    init(url: URL) async throws {
        
        let data: Data
        if url.isFileURL {
            do {
                data = try Data(contentsOf: url)
            } catch {
                throw error
            }
        } else {
            let response: URLResponse
            do {
                (data, response) = try await URLSession.shared.data(from: url)
            } catch {
                throw error
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NSError(domain: "com.rmishyn.travel", code: 0, userInfo: [NSLocalizedDescriptionKey:"Invalid response type: \(response.typeName)"])
            }
            guard httpResponse.statusCode == 200 else {
                throw NSError(domain: "com.rmishyn.travel", code: 0, userInfo: [NSLocalizedDescriptionKey:"Invalid response code: \(httpResponse.statusCode)"])
            }
        }
        self = data
    }
}
