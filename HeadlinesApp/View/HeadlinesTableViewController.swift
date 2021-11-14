//
//  HeadlinesTableViewController.swift
//  HeadlinesApp
//
//  Created by Mohammad Azam on 12/16/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class HeadlinesTableViewController : UITableViewController {
    private var HeadlinelistViewModel : HeadLineListViewModels!
    var source :Source!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    private func updateUI() {
       self.title = self.source.name
        self.HeadlinelistViewModel = HeadLineListViewModels(id: source.id, completion: {
            self.tableView.reloadData()
        })
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HeadlinelistViewModel.ListNumber()
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HeadlineTableViewCell

        let headline = self.HeadlinelistViewModel.SourceAt(index: indexPath)

        cell.titleLabel.text = headline.title
        cell.descriptionLabel.text = headline.description
        
        return cell
    }
    
}
