//
//  HeadLineListViewModels.swift
//  HeadlinesApp
//
//  Created by Macbook on 10/03/2021.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

class HeadLineListViewModels {
    private var webService : WebService
    private var HeadLineViewModel :[Headline] = [Headline]()
    private var completion : () -> () = { }
    init(id : String,completion : @escaping () -> ()) {
        self.webService = WebService()
        self.completion = completion
        populateHeadLines(id : id)
    }
    private func populateHeadLines (id : String) {
          
           self.webService.LoadHeadlines(id: id) { (Headlines) in
            self.HeadLineViewModel = Headlines
            self.completion()
        }}
    func SourceAt(index : IndexPath) -> Headline {
        return self.HeadLineViewModel[index.row]
    }
    func ListNumber() -> Int {
        return HeadLineViewModel.count
    }
    
}
