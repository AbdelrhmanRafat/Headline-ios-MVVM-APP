//
//  SourceListViewModels.swift
//  HeadlinesApp
//
//  Created by Macbook on 10/03/2021.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

class SourceListViewModels {
    private var webService : WebService
    private var sourcesViewModel :[Source] = [Source]()
    private var completion : () -> () = { }
    init(completion : @escaping () -> ()) {
        self.webService = WebService()
        self.completion = completion
        populateSources()
    }
    private func populateSources () {
        
        self.webService.LoadSources { (sources) in
            self.sourcesViewModel = sources
            self.completion()
        }
    }
    func SourceAt(index : IndexPath) -> Source {
        return self.sourcesViewModel[index.row]
    }
    func ListNumber() -> Int {
        return sourcesViewModel.count
    }}
