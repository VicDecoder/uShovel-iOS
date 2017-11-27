//
//  JobViewController.swift
//  uShovel
//
//  Created by Victor Loyinmi on 2017-10-27.
//  Copyright © 2017 Team Byte. All rights reserved.
//

import UIKit

class JobViewController: UIViewController {

    @IBOutlet weak var jobTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GetJobs()//For Debugging
        PostJobs()// For Debugging
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}

