//
//  ContentView.swift
//  onAppear
//
//  Created by Clement Lumumba on 15/07/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Welcome 🐾")
                    .font(.largeTitle)

                NavigationLink("Show Live Cat Facts") {
                    LiveFactsView()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

struct LiveFactsView: View {
    @State private var fact: String = "Waiting for cat facts..."

    var body: some View {
        VStack(spacing: 20) {
            Text("Live Cat Facts 🐈")
                .font(.title)

            Text(fact)
                .multilineTextAlignment(.center)
                .padding()
        }
        .task {
            for await newFact in catFactStream() {
                withAnimation {
                    fact = newFact
                    print("🖨️ UI updated with: \(newFact)") // Console log
                }
            }
        }
        .padding()
    }

    func catFactStream() -> AsyncStream<String> {
        AsyncStream { continuation in
            Task {
                while !Task.isCancelled {
                    if let fact = await fetchCatFact() {
                        continuation.yield(fact)
                    }
                    try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
                }
                continuation.finish()
            }
        }
    }

    func fetchCatFact() async -> String? {
        guard let url = URL(string: "https://catfact.ninja/fact") else {
            return "Invalid URL"
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(CatFact.self, from: data)
            return decoded.fact
        } catch {
            return "Error: \(error.localizedDescription)"
        }
    }

    struct CatFact: Codable {
        let fact: String
    }
}

#Preview {
    ContentView()
}
