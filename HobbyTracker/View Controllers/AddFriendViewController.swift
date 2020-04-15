//
//  AddFriendViewController.swift
//  HobbyTracker
//
//  Created by Ben Gohlke on 7/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class AddFriendViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var hometownTextField: UITextField!
    @IBOutlet weak var hobby1TextField: UITextField!
    @IBOutlet weak var hobby2TextField: UITextField!
    @IBOutlet weak var hobby3TextField: UITextField!
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
    }
}

extension AddFriendViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
