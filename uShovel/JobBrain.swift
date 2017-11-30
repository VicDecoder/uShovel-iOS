//
//  JobBrain.swift
//  uShovel
//
//  Created by Victor Loyinmi on 2017-10-27.
//  Copyright © 2017 Team Byte. All rights reserved.
//

import Foundation

    
var jsonData:Any?
private let GetUrl:URL = URL(string: "https://cmpt370-2017.herokuapp.com/jobs")!//Url for jobs
private let requestedComponents: Set<Calendar.Component> = [
    .year,
    .month,
    .day
]

private let today = Calendar.current.dateComponents(requestedComponents, from: Date())
func GetJobs(){
    print("Getting Jobs")//Take this out in production
    URLSession.shared.dataTask(with: GetUrl){(data,response, error) in
        if let response = response {
            print(response)
        }
        if let data = data {
            print(data)
            do{
                  jsonData=try JSONSerialization.jsonObject(with: data, options: [])//Gets the jobs on the back end and stores it in jsonDa
                    let result=jsonData as! NSArray
                    print("The first one is \(result[0])")
            }catch{
                print(error )
            }
        }
        }.resume()
}
    func PostJobs(){
        print("Posting Jobs ")//Take This out in production
        let parameters =
            ["User_ID":"11201491","Location":"1601 Arid St","JobDate":"\(today.year!)-\(today.month!)-\(today.day!)"]//
        var request=URLRequest(url: GetUrl)
        request.httpMethod = "POST"
        request.httpBody=try? JSONSerialization.data(withJSONObject: parameters, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: GetUrl){(data,response,error)in
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

