//
//  PandaCollectionFetcher.swift
//  MemeCreator
//
//  Created by Uchchhwas Roy on 24/3/23.
//

import Foundation

class PandaCollectionFetcher: ObservableObject {
    @Published var imageData = PandaCollection(sample: [Panda.defaultPanda])
    @Published var currentPanda = Panda.defaultPanda
    
    let urlString = "https://playgrounds-cdn.apple.com/assets/pandaData.json"
    
    enum FetchError: Error {
        case badRequest
        case badJson
    }
    
    func fetchData() async
    throws {
        guard let url = URL(string: urlString) else { return }
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {throw FetchError.badRequest}
        
        Task {@MainActor in
            imageData = try JSONDecoder().decode(PandaCollection.self, from: data)
        }
    }
}
