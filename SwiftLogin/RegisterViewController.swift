//
//  RegisterViewController.swift
//  SwiftLogin
//
//  Created by Tyler Youschak on 10/14/15.
//  Copyright © 2015 Tyler Youschak. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {
    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let userRepeatPassword = repeatPasswordTextField.text;
        
        // Check if fields have content
        if(userEmail!.isEmpty || userPassword!.isEmpty || userRepeatPassword!.isEmpty) {
            
            // Display alert message
            
            displayMyAlertMessage("All fields are required");
            
            return;
        }
        
        // Check if passwords are equal
        if(userPassword != userRepeatPassword) {
            // Display an alert message
            displayMyAlertMessage("Passwords do not match");
            return;
            
        }

        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setValue(userEmail, forKey: "userEmail")
        userDefaults.setValue(userPassword, forKey: "userPassword")
        userDefaults.synchronize() // don't forget this!!!!


  
        var myAlert = UIAlertController(title:"Alert", message:"Registration is successful. Thank you!", preferredStyle: UIAlertControllerStyle.Alert);

        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default){ action in
            self.dismissViewControllerAnimated(true, completion:nil);
        }

        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated:true, completion:nil);
        
        return;
            
            
        
    }
    
    
    func displayMyAlertMessage(userMessage:String) {
        
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default, handler:nil);
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated:true, completion:nil);
        
    }
    
    @IBAction func iHaveAnAccountButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
