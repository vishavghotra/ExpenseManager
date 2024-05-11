//
//  OpenAIService.swift
//  TripManager
//
//
//

import Foundation

// Source: https://betterprogramming.pub/dall-e-api-in-swift-generate-faces-e39a2625a5a2


enum OpenAIEndpoint: String {
    private var baseURL: String { return "https://api.openai.com/v1/images/" }

    case generations
    case edits

    var url: URL {
            guard let url = URL(string: baseURL) else {
                preconditionFailure("The url is not valid")
            }
            return url.appendingPathComponent(self.rawValue)
    }
}

struct DALLEResponse: Decodable {
    let created: Int
    let data: [Photo]
}

struct Photo: Decodable {
    let url: String
}

class OpenAIService: ObservableObject {
    let api_key_free = "random_key"

    func generateImage(from prompt: String) async throws -> [Photo] {
        var request = URLRequest(url: OpenAIEndpoint.generations.url)
        request.setValue("Bearer \(api_key_free)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

        let parameters: [String: Any] = [
            "prompt": prompt,
            "n": 1,
            "size": "256x256"
        ]

        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)

        request.httpBody = jsonData

        let (data, _) = try await URLSession.shared.data(for: request)
        let dalleResponse = try? JSONDecoder().decode(DALLEResponse.self, from: data)

        return dalleResponse?.data ?? []
    }
}
