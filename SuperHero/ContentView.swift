//
//  ContentView.swift
//  SuperHero
//
//  Created by Hernán Rodríguez on 1/8/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @State var superHeroName: String = ""
    @State var wrapper: ApiNetwork.Wrapper? = nil
    @State var loading: Bool = false
    @State var searchPerformed: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Super Héroe", text: $superHeroName)
                    .padding(16)
                    .border(.primary, width: 1.5)
                    .padding(8)
                    .autocorrectionDisabled()
                    .accentColor(.primary)
                    .onSubmit {
                        startSearch()
                    }
                
                if loading {
                    ProgressView().tint(.primary)
                }
                
                if searchPerformed && !loading && (wrapper?.results.isEmpty ?? true) {
                    Text("No se encontraron resultados")
                        .foregroundColor(.secondary)
                        .padding()
                }
                
                List(wrapper?.results ?? []) { superhero in
                    NavigationLink(destination: DetailsSuperHero(superhero: superhero)) {
                        SuperHeroItem(superhero: superhero)
                    }
                }
                .listStyle(.plain)
                .background(Color.backgroundApp)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.backgroundApp)
            .navigationBarTitle("SuperHero Finder", displayMode: .automatic)
        }
    }
    
    private func startSearch() {
        loading = true
        wrapper = nil
        searchPerformed = true
        Task {
            do {
                wrapper = try await ApiNetwork().getHeroesByQuery(query: superHeroName)
            } catch {
                print("Error")
            }
            loading = false
        }
    }
}

struct SuperHeroItem: View {
    let superhero: ApiNetwork.SuperHero
    
    var body: some View {
        HStack(spacing: 0) {
            WebImage(url: URL(string: superhero.image.url))
                .resizable()
                .indicator(.activity)
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 200)
                .listRowBackground(Color.backgroundApp)
            
            VStack {
                Spacer()
                Text(superhero.name)
                    .foregroundColor(.primary)
                    .bold()
                    .frame(maxWidth: .infinity)
                Spacer()
                Text(superhero.biography.fullName)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity)
                Spacer()
                Text(superhero.biography.publisher)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity)
                Spacer()
            }
            .padding()
            .background(Color.backgroundComponent2.opacity(0.5))
        }
        .frame(height: 200)
        .cornerRadius(16)
        .listRowBackground(Color.backgroundApp)
        .cornerRadius(16)
    }
}

#Preview {
    ContentView()
}
