//
//  LoginViewController.swift
//  uShovel
//
//  Created by Victor Loyinmi on 2017-11-29.
//  Copyright © 2017 Team Byte. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    private var authURL:URL = URL(string: "https://cmpt370-2017.herokuapp.com/authenticate")!
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        let email=emailField.text!
        let pass=passField.text!
        
        authenticate(email:email, pass:pass)
        
    }
    func authenticate(email: String, pass:String){
        let parameters=["email":"\(email)","password":"\(pass)"]
        var request=URLRequest(url: authURL)
        request.httpMethod = "POST"
        request.httpBody=try? JSONSerialization.data(withJSONObject: parameters, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: authURL){(data,response,error)in
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
