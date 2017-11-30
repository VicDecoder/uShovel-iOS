//
//  Job.swift
//  uShovel
//
//  Created by Victor Loyinmi on 2017-11-27.
//  Copyright © 2017 Team Byte. All rights reserved.
//

import Foundation
struct Job: Decodable{
     var completed:Int
     var  date:String
     var JobId:Int
     var location:String
     var userId:String
    /**
    init(Completed:Int, Date: String, JobID:Int, Location: String, UserID:String) {
        completed=Completed
        location=Location
        date=Date
        JobId=JobID
        userId=UserID
        
    }*/
    
}
