//
//  AddFriendViewController.swift
//  HobbyTracker
//
//  Created by Ben Gohlke on 7/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

// Delegation Design Pattern
// Delegator responsibilities
// Step 1: Create a delegate protocol
// Step 2: Create a delegate property on delegator file of type delegate
// Step 3: Call methods on delegate when necessary

// Delegate

protocol AddFriendDelegate {
    func newFriendAdded(friend: Friend)
}

class AddFriendViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var hometownTextField: UITextField!
    @IBOutlet weak var hobby1TextField: UITextField!
    @IBOutlet weak var hobby2TextField: UITextField!
    @IBOutlet weak var hobby3TextField: UITextField!
    
    var delegate: AddFriendDelegate? // Basketball Broadcasters
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        // Harvest user input
        // Validate the data
        guard let name = nameTextField.text,
            let hometown = hometownTextField.text,
            !name.isEmpty,
            !hometown.isEmpty
            else { return }
        
        // Create friend
        var friend = Friend(name: name, hometown: hometown, hobbies: [])
        
        if let hobby1 = hobby1TextField.text,
            !hobby1.isEmpty {
            friend.hobbies.append(hobby1)
        }
        
        if let hobby2 = hobby2TextField.text,
            !hobby2.isEmpty {
            friend.hobbies.append(hobby2)
        }
        
        if let hobby3 = hobby3TextField.text,
            !hobby3.isEmpty {
            friend.hobbies.append(hobby3)
        }
        
        delegate?.newFriendAdded(friend: friend)
        dismiss(animated: true, completion: nil)
    }
}

extension AddFriendViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
