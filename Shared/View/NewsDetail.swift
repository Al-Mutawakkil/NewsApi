//
//  NewsDetail.swift
//  NewsApi
//
//  Created by Numair on 04/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsDetail: View {
  let news: News
  var body: some View {
    ScrollView{
      VStack(alignment: .leading) {
        WebImage(url: URL(string: news.image)!)
          .resizable()
          .scaledToFit()
          .clipped()
        VStack(alignment: .leading, spacing: 20) {
          Text(news.title)
            .font(.title)
            .bold()
          Text(news.description)
            .font(.body)
        }
        .padding()
      }
    }
  }
}

struct NewsDetail_Previews: PreviewProvider {
  static var previews: some View {
    NewsDetail(news: News(title: "", image: "", description: ""))
  }
}
