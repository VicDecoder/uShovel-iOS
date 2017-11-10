//
//  JobBrain.swift
//  uShovel
//
//  Created by Victor Loyinmi on 2017-10-27.
//  Copyright © 2017 Team Byte. All rights reserved.
//

import Foundation
private let GetUrl:URL = URL(string: "https://cmpt370-2017.herokuapp.com/jobs")!//Url for jobs


func GetJobs() {
    
    URLSession.shared.dataTask(with: GetUrl){(data,response, error) in
        if let response = response {
            print(response)
        }
        if let data = data {
            print(data)
            do{
                 let jsonData=try JSONSerialization.jsonObject(with: data, options: [])//Gets the jobs on the back end and stores it in jsonDa
                print(jsonData)
            }catch{
                print(error )
            }
        }
        }.resume()
}
