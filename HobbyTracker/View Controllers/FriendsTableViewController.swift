//
//  FriendsTableViewController.swift
//  HobbyTracker
//
//  Created by Ben Gohlke on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class FriendsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}

extension FriendsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
        return cell
    }
}

