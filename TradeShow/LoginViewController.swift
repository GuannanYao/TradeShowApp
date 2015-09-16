//
//  LoginViewController.swift
//  TradeShow
//
//  Created by Guannan Yao on 17/09/2015.
//  Copyright (c) 2015 University of Wollongong. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var pwd: UITextField!
    
    let storeUsr = "guannan"
    let storePwd = "1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(sender: AnyObject) {
        let usrName = userName.text!
        //println(usrName)
        let password = pwd.text!
       // println(password)
        
        if(usrName != storeUsr || password != storePwd){
            displayAlertMsg("Wrong password or user name")
        }
        
        if(usrName == storeUsr){
            if(password == storePwd){
                //println("log in successful")
                self.performSegueWithIdentifier("login", sender: self)
            }
        }
        
    }

    func displayAlertMsg(usrMsg:String){
        var myAlert = UIAlertController(title: "Login Wrong", message: usrMsg, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
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
