//
//  ContentView.swift
//  Shared
//
//  Created by Numair on 04/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
  @ObservedObject var newsViewModel = NewsViewModel()
  
  var body: some View {
    NavigationView {
      List(newsViewModel.data) { item in
        NavigationLink(
          destination: NewsDetail(news: item),
          label: {
            HStack {
              if item.image != "" {
                WebImage(url: URL(string: item.image))
                  .resizable()
                  .scaledToFill()
                  .frame(width: 120, height: 170)
                  .background(Image("loader")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 30))
                  .cornerRadius(10)
              } else {
                Image("loader")
              }
              VStack(alignment: .leading, spacing: 10) {
                Text(item.title)
                  .bold()
                  .lineLimit(2)
                Text(item.title)
                  .font(.subheadline)
                  .lineLimit(4)
              }
            }
          })
      }
      .navigationBarTitle("News")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
