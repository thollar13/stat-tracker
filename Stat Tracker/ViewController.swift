//
//  ViewController.swift
//  Stat Tracker
//
//  Created by Thomas on 5/13/15.
//  Copyright (c) 2015 Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //// fields
    @IBOutlet var personName: UILabel!
    @IBOutlet var personEmail: UILabel!
    @IBOutlet var nameInput: UITextField!
    @IBOutlet var emailInput: UITextField!
    @IBOutlet var nameInputButton: UIButton!
    @IBOutlet var bottomToolbar: UIToolbar!
    
    //// actions
    @IBAction func setName(sender: AnyObject) {
        var userName = nameInput.text
        var userEmail = emailInput.text
        NSUserDefaults.standardUserDefaults().setObject(userName, forKey: "name")
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey: "userEmail")
        
        personName.text = userName
        personEmail.text = userEmail
        signedIn()
    }
    
    /// helper functions
    func signedIn() {
        nameInput.hidden = true
        emailInput.hidden = true
        nameInputButton.hidden = true
    }
    
    /// on load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var name = NSUserDefaults.standardUserDefaults().objectForKey("name") as! String
        var email = NSUserDefaults.standardUserDefaults().objectForKey("userEmail") as! String
        
        if name != "" || email != "" {
            personName.text = name
            personEmail.text = email
            signedIn()
        } else {
           personName.text = nil
           personEmail.text = nil
           bottomToolbar.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

