//
//  ApiNetwork.swift
//  SuperHero
//
//  Created by Hernán Rodríguez on 1/8/24.
//

import Foundation

class ApiNetwork {
    
    struct Wrapper: Codable {
        let response: String
        let results: [SuperHero]
    }
    
    struct SuperHero: Codable, Identifiable {
        let id: String
        let name: String
        let powerstats: PowerStats
        let biography: Biography
        let appearance: Appearance
        let work: Work
        let connections: Connections
        let image: ImageSuperHero
    }
    
    struct PowerStats: Codable {
        let intelligence: String
        let strength: String
        let speed: String
        let durability: String
        let power: String
        let combat: String
    }
    
    struct Biography: Codable {
        let fullName: String
        let alterEgos: String
        let aliases: [String]
        let placeOfBirth: String
        let firstAppearance: String
        let publisher: String
        let alignment: String
        
        enum CodingKeys: String, CodingKey {
            case fullName = "full-name"
            case alterEgos = "alter-egos"
            case aliases
            case placeOfBirth = "place-of-birth"
            case firstAppearance = "first-appearance"
            case publisher
            case alignment
        }
    }
    
    struct Appearance: Codable {
        let gender: String
        let race: String
        let height: [String]
        let weight: [String]
        let eyeColor: String
        let hairColor: String
        
        enum CodingKeys: String, CodingKey {
            case eyeColor = "eye-color"
            case hairColor = "hair-color"
            case gender, race, height, weight
        }
    }
    
    struct Work: Codable {
        let occupation: String
        let base: String
    }
    
    struct Connections: Codable {
        let groupAffiliation: String
        let relatives: String
        
        enum CodingKeys: String, CodingKey {
            case groupAffiliation = "group-affiliation"
            case relatives
        }
    }
    
    struct ImageSuperHero: Codable {
        let url: String
    }
    
    func getHeroesByQuery(query: String) async throws -> Wrapper {
        let token = "1d3282f292509015fa61d5de086c09ce"
        let url = URL(string: "https://superheroapi.com/api/\(token)/search/\(query)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        
        return wrapper
    }
}
