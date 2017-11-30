//
//  SignUpViewController.swift
//  uShovel
//
//  Created by Victor Loyinmi on 2017-11-29.
//  Copyright © 2017 Team Byte. All rights reserved.
//

import UIKit
import Foundation

class SignUpViewController: UIViewController {

    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var emailfield: UITextField!
    @IBOutlet weak var initialPassField: UITextField!//Initial password field
    @IBOutlet weak var finalPassField: UITextField!//Final password field
    private var signUpURL:URL = URL(string: "https://cmpt370-2017.herokuapp.com/users")!
    
    @IBAction func signUp(_ sender: UIButton) {
        let fullname = fullNameField.text!
        let iniPassword = initialPassField.text!
        let finalPassword=finalPassField.text!
        let email = emailfield.text!
        //Check email
        
        //check Password
        if (iniPassword != finalPassword){
            let alert = UIAlertController(title: "Error", message: "The password does not match", preferredStyle: UIAlertControllerStyle.alert)//Create an alert for the error
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alert,animated: true, completion: nil)
        }
        else if  finalPassword.count < 8 {
            let alert = UIAlertController(title: "Invalid", message: "Password must be greater than 8 characters",preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alert,animated: true, completion: nil)
        }
        else{
        //Request to add user
        let parameters=["Email":"\(email)","Name":"\(fullname)","Passwd":"\(finalPassword)"]
        var request=URLRequest(url: signUpURL)
        request.httpMethod = "POST"
        request.httpBody=try? JSONSerialization.data(withJSONObject: parameters, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: signUpURL){(data,response,error)in
            if let response = response{
                print (response)
            }
            if let data=data{
                print (data)
                do{
                    let postJson=try JSONSerialization.jsonObject(with: data, options: [])
                    print(postJson)
                }
                catch{
                    print(error.localizedDescription)
                }
            }
            }.resume()
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
