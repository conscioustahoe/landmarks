//
//  MessageData.swift
//  landmarks
//
//  Created by Ashutosh Narang on 04/02/23.
//

import Foundation

struct RequestBody: Codable {
    let user_id: String
    let text: String
    let is_prompt: Bool
}

struct ResponseBody: Decodable {
    let response: String
}

class MessageState {
    
    func callGPT(prompt : String, completion: @escaping (Result<String, Error>)->()) {
        let requestBody = RequestBody(user_id: "1", text: prompt, is_prompt: true)
        let url = URL(string: "https://af-backend-gu2hcas3ba-uw.a.run.app/chat/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONEncoder().encode(requestBody)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            let response = try! JSONDecoder().decode(ResponseBody.self, from: data)
            DispatchQueue.main.async {
                print(response.response)
                completion(.success(response.response))
            }
        }.resume()
    }

}



