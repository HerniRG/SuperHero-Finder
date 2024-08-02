//
//  DetailsSuperHero.swift
//  SuperHero
//
//  Created by Hernán Rodríguez on 1/8/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailsSuperHero: View {
    let superhero: ApiNetwork.SuperHero
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                WebImage(url: URL(string: superhero.image.url))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 200)
                    .cornerRadius(12)
                    .shadow(radius: 10)
                    .listRowBackground(Color.backgroundApp)
                
                Text(superhero.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                PowerStatsSection(powerstats: superhero.powerstats)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(.backgroundComponent1)
                    .cornerRadius(10)
                
                BiographySection(biography: superhero.biography)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(.backgroundComponent1)
                    .cornerRadius(10)
                
                AppearanceSection(appearance: superhero.appearance)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(.backgroundComponent1)
                    .cornerRadius(10)
                
                WorkSection(work: superhero.work)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(.backgroundComponent1)
                    .cornerRadius(10)
                
                ConnectionsSection(connections: superhero.connections)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(.backgroundComponent1)
                    .cornerRadius(10)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
    }
}

struct PowerStatsSection: View {
    let powerstats: ApiNetwork.PowerStats
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Power Stats")
                .font(.title2)
                .fontWeight(.bold)
            
            ForEach(powerstats.allStats(), id: \.name) { stat in
                PowerStatView(statName: stat.name, value: stat.value)
            }
        }
    }
}

struct BiographySection: View {
    let biography: ApiNetwork.Biography
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Biography")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("Full Name: \(biography.fullName)")
            Text("Alter Egos: \(biography.alterEgos)")
            Text("Aliases: \(biography.aliases.joined(separator: ", "))")
            Text("Place of Birth: \(biography.placeOfBirth)")
            Text("First Appearance: \(biography.firstAppearance)")
            Text("Publisher: \(biography.publisher)")
            Text("Alignment: \(biography.alignment)")
        }
    }
}

struct AppearanceSection: View {
    let appearance: ApiNetwork.Appearance
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Appearance")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("Gender: \(appearance.gender)")
            Text("Race: \(appearance.race)")
            Text("Height: \(appearance.height.joined(separator: ", "))")
            Text("Weight: \(appearance.weight.joined(separator: ", "))")
            Text("Eye Color: \(appearance.eyeColor)")
            Text("Hair Color: \(appearance.hairColor)")
        }
    }
}

struct WorkSection: View {
    let work: ApiNetwork.Work
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Work")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("Occupation: \(work.occupation)")
            Text("Base: \(work.base)")
        }
    }
}

struct ConnectionsSection: View {
    let connections: ApiNetwork.Connections
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Connections")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("Group Affiliation: \(connections.groupAffiliation)")
            Text("Relatives: \(connections.relatives)")
        }
    }
}

struct PowerStatView: View {
    let statName: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(statName)
                    .font(.headline)
                Spacer()
                Text(value)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            ProgressView(value: Double(value) ?? 0, total: 100)
                .progressViewStyle(LinearProgressViewStyle(tint: colorForStat(statName: statName)))
        }
    }
    
    func colorForStat(statName: String) -> Color {
        switch statName {
        case "Intelligence":
            return .blue
        case "Strength":
            return .red
        case "Speed":
            return .green
        case "Durability":
            return .yellow
        case "Power":
            return .purple
        case "Combat":
            return .orange
        default:
            return .gray
        }
    }
}

// Extension to make it easier to iterate through stats
extension ApiNetwork.PowerStats {
    func allStats() -> [(name: String, value: String)] {
        return [
            (name: "Intelligence", value: intelligence),
            (name: "Strength", value: strength),
            (name: "Speed", value: speed),
            (name: "Durability", value: durability),
            (name: "Power", value: power),
            (name: "Combat", value: combat)
        ]
    }
}

struct DetailsSuperHero_Previews: PreviewProvider {
    static var previews: some View {
        let sampleHero = ApiNetwork.SuperHero(
            id: "1",
            name: "Superman",
            powerstats: ApiNetwork.PowerStats(intelligence: "94", strength: "100", speed: "100", durability: "100", power: "100", combat: "85"),
            biography: ApiNetwork.Biography(fullName: "Clark Kent", alterEgos: "No alter egos found.", aliases: ["Kal-El", "The Man of Steel"], placeOfBirth: "Krypton", firstAppearance: "Action Comics #1", publisher: "DC Comics", alignment: "good"),
            appearance: ApiNetwork.Appearance(gender: "Male", race: "Kryptonian", height: ["6'3", "191 cm"], weight: ["225 lb", "101 kg"], eyeColor: "Blue", hairColor: "Black"),
            work: ApiNetwork.Work(occupation: "Reporter", base: "Metropolis"),
            connections: ApiNetwork.Connections(groupAffiliation: "Justice League", relatives: "Kara Zor-El (cousin), Jonathan Kent (adoptive father), Martha Kent (adoptive mother)"),
            image: ApiNetwork.ImageSuperHero(url: "https://www.superherodb.com/pictures2/portraits/10/100/10441.jpg")
        )
        
        DetailsSuperHero(superhero: sampleHero)
    }
}
