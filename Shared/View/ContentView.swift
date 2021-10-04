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
          }
          VStack {
            Text(item.title)
              .font(.headline)
            Text(item.description)
              .font(.caption)
          }.frame(height: 170)
        }
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
