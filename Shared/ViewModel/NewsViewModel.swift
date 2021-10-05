//
//  NewsViewModel.swift
//  NewsApi
//
//  Created by Numair on 04/10/21.
//

import Foundation
import SwiftyJSON
import Combine

class NewsViewModel: ObservableObject {
  @Published var data = [News]()
  
  init() {
    let url = ""
    
    let session = URLSession(configuration: .default)
    
    session.dataTask(with: URL(string: url)!) { (data, _, error) in
      if error != nil {
        print((error?.localizedDescription)!) // Handle optional biar langsung dua-duanya pake ()
        return
      }
      
      let json = try! JSON(data: data!)
      let articles = json["articles"].array!
      
      for item in articles {
        let title = item["title"].stringValue
        let description = item["description"].stringValue
        let image = item["urlToImage"].stringValue
        
        DispatchQueue.main.async {
          self.data.append(News(title: title, image: image, description: description))
        }
      }
    }.resume()
  }
}
