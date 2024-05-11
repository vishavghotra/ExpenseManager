//
//  MoneyImage.swift
//
//
// Source: https://betterprogramming.pub/dall-e-api-in-swift-generate-faces-e39a2625a5a2
//

import SwiftUI

struct MoneyImage: View {
  @ObservedObject var fetcher = OpenAIService()
  @State var photos: [Photo] = []

  var body: some View {
    VStack {
      List {
        ForEach(photos, id: \.url) { photo in
          AsyncImage(url: URL(string: photo.url)) { image in
            image.resizable().aspectRatio(contentMode: .fit)
          } placeholder: {
            Image(systemName: "photo.fill")
          }.frame(maxWidth: .infinity, maxHeight: 500).listRowInsets(.init(.zero))
        }
      }
      Button(action: runOpenAIGeneration, label: { Text("Money Spent!") })
    }
  }

  func runOpenAIGeneration() {
    Task {
      do { self.photos = try await fetcher.generateImage(from: "Money") } catch {
        print(error)
      }
    }
  }
}
