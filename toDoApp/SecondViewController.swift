//
//  SecondViewController.swift
//  toDoApp
//
//  Created by Animesh Manglik on 12/9/16.
//  Copyright © 2016 Animesh Manglik. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var toDoItem: UITextField!
    
    @IBAction func addItemPressed(_ sender: AnyObject) {
        
        let itemObjects = UserDefaults.standard.object(forKey: "items")

        var items:[String] = []
        
        if let tempItems = itemObjects as? [String] {
            items = tempItems
            items.append(toDoItem.text!)
        } else {
            items = [toDoItem.text!]
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        
        toDoItem.text = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

