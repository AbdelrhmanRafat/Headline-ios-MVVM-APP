//
//  WebService.swift
//  HeadlinesApp
//
//  Created by Macbook on 10/03/2021.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

class WebService {
    
    func LoadSources(completion : @escaping ([Source]) -> ()) {
        
        var sources = [Source]()
        let sourceURL = URL(string :"https://newsapi.org/v2/sources?apiKey=0cf790498275413a9247f8b94b3843fd")!
        URLSession.shared.dataTask(with: sourceURL) { data, _, _ in
            
            if let data = data {
                
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                let dictionary = json as! [String:Any]
                let sourcesDictionary = dictionary["sources"] as! [[String:Any]]
                sources = sourcesDictionary.flatMap(Source.init)
                
                DispatchQueue.main.async {
                    completion(sources)
                }
            }
            
            }.resume()
    }
    func LoadHeadlines (id : String ,completion : @escaping ([Headline]) -> () ) {
        // get the headlines by source
        var Headlines = [Headline]()
        let url = URL(string :"https://newsapi.org/v2/top-headlines?sources=\(id)&apiKey=0cf790498275413a9247f8b94b3843fd")!
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            if let data = data {
                
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                let dictionary = json as! [String:Any]
                let headlineDictionaries = dictionary["articles"] as! [[String:Any]]
                Headlines = headlineDictionaries.flatMap(Headline.init)
                
                DispatchQueue.main.async {
                    completion(Headlines)
                }
            }
            
            }.resume()
    }
    
    
}
