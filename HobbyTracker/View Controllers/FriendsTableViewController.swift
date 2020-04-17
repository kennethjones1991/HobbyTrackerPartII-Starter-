//
//  FriendsTableViewController.swift
//  HobbyTracker
//
//  Created by Ben Gohlke on 7/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class FriendsTableViewController: UIViewController {
    
    var friends: [Friend] = []
    
    @IBOutlet weak var tableView: UITableView!
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddFriendModalSegue" {
            if let addVC = segue.destination as? AddFriendViewController {
                addVC.delegate = self
            }
        } else if segue.identifier == "ShowFriendDetailSegue" {
            if let detailVC = segue.destination as? FriendDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                let friend = friends[indexPath.row]
                detailVC.friend = friend
            }
        }
    }
}

// Setting up a TableVie on a UIViewController
// Step 1: Add ViewController as Data Source in Main .storyboard (Drag ctrl drag from table to view controller)
// Step 2: Adopt and conform to UITableViewDataSource (and UITableViewDelegate if necessary)
extension FriendsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
            as? FriendTableViewCell else { return UITableViewCell() }
        
        let friend = friends[indexPath.row]
        cell.friend = friend
        return cell
    }
}

// Delegate responsibilities
// Step 1: Adopt and Conform to the delegate
// Step 2: Set self as delegate when Delegator is created
extension FriendsTableViewController: AddFriendDelegate {
    func newFriendAdded(friend: Friend) {
        friends.append(friend)
        tableView.reloadData()
    }
}

