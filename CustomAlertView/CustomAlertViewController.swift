//
//  ViewController.swift
//  CustomAlertView
//
//  Created by Oktay on 12.02.2020.
//  Copyright © 2020 Oktay. All rights reserved.
//

import UIKit

class CustomAlertViewController: UIViewController {
    // MARK: - UI Elements
    @IBOutlet weak var viewInfoLabel: UILabel!
    @IBOutlet weak var customAlertButton: UIButton!
    @IBOutlet weak var defaultAlertButton: UIButton!
    
    // MARK: - Stored Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewInfoLabel.text = "Tap buttons to see some alert views. Have fun!"
        
    }
    // MARK: - Functions
    // Default alert function
    func defaultAlertController(title: String, message: String) {
        let defaultalert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let firstAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            print("Ok tapped")
        }
        defaultalert.addAction(firstAction)
        let secondAction = UIAlertAction(title: "Wow", style: .cancel) { (action) in
            print("Wow tapped")
        }
        defaultalert.addAction(secondAction)
        present(defaultalert, animated: true, completion: nil)
    }
    // Custom alert function
    func customAlertController(title: String, message: String) {
        // We need attributed String for custom strings for our alert so we can change size, color and etc.
        let attributedStringTitle = NSAttributedString(string: title, attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor : UIColor.white
        ])
        let attributedStringMessage = NSAttributedString(string: message, attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15),
            NSAttributedString.Key.foregroundColor : UIColor.white
        ])
        // Default alertController class
        let alert = UIAlertController(title: title, message: message,  preferredStyle: .alert)
        // We set our custom title and message to our alertViewController
        alert.setValue(attributedStringTitle, forKey: "attributedTitle")
        alert.setValue(attributedStringMessage, forKey: "attributedMessage")
        let cancelAction = UIAlertAction(title: "Done", style: .cancel) { (action) in
            // NOTE: We can handle our action in this area for what we want to happen when this action is triggered "Also style '.destructive' makes alert with red color"
            print("Cancel Tapped")
        }
        // Add the action to alert
        alert.addAction(cancelAction)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // NOTE: We can handle our action in this area for what we want to happen when this action is triggered "Also style '.destructive' makes alert with red color"
            print("Ok tapped")
        }
        // Add the action to alert
        alert.addAction(okAction)
        present(alert,animated: true,completion: nil)
        // Add a subView and change color alert background and cornderRadius
        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
        subview.layer.cornerRadius = 50
        subview.backgroundColor = UIColor(red: (79/255.0), green: (101/255.0), blue: (211/255.0), alpha: 1.0)
        
    }
    
    // MARK: - Actions
    // Default alert button
    @IBAction func defaultAlertViewButtonTapped() {
        defaultAlertController(title: "Hello this is a title", message: "Hello this is a message")
    }
    // Custom alert button
    @IBAction func customAlertButtonTapped() {
        customAlertController(title: "Hello this is a title with custom color", message: "Hello this is a message with custom color")
    }
    
}


