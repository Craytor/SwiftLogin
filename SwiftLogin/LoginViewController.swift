//
//  LoginViewController.swift
//  SwiftLogin
//
//  Created by Tyler Youschak on 10/14/15.
//  Copyright © 2015 Tyler Youschak. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        
//        let userEmailStored = NSUserDefaults.standardUserDefaults().stringForKey("userEmail");
        
//        let userPasswordStored = NSUserDefaults.standardUserDefaults().stringForKey("userPassword");
        let userEmailStored = "tyleryouschak@gmail.com"
        let userPasswordStored = "1c8a9cd470"
        
        if(userEmailStored == userEmail) {
            if(userPasswordStored == userPassword) {
                // Login is successfull
                NSUserDefaults.standardUserDefaults().setBool(true,forKey:"isUserLoggedIn");
                NSUserDefaults.standardUserDefaults().synchronize();
                
                self.dismissViewControllerAnimated(true, completion:nil);
            } else {
                displayMyAlertMessage("The email address provided does not match our records, or the password supplied is incorrect.");
                return;

            }
        } else {
            displayMyAlertMessage("A username and password is required.");
            return;
        }
        
        
    }
    
    func displayMyAlertMessage(userMessage:String) {
        
        let myAlert = UIAlertController(title:"Whoops!", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default, handler:nil);
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated:true, completion:nil);
        
    }

    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

