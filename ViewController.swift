//
//  ViewController.swift
//  TopApps
//
//  Created by Alivelu Ravula on 4/24/18.
//  Copyright © 2018 Roja. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    var URLSObj:URLSession?
    var URLReq:URLRequest?
    var URLSDataTask:URLSessionDataTask?
    
    var appNamArry  = [String]()
    var imgArry = [String]()
    var urlArry = [String]()
    var artistArry = [String]()
    var releaseDat = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "APPsDisplayTVC"
        {                let appVC=segue.destination as! APPsDisplayTVC
            
            appVC.appArryInTbl=appNamArry
            appVC.imgArryInTbl=imgArry
            appVC.artistArryInTbl=artistArry
            appVC.releaseDatArryInTbl=releaseDat
            appVC.urlArryInTbl=urlArry
            
            
            
            print(appVC.appArryInTbl)
            print(appNamArry)
            
        }
        self.URLSObj=URLSession(configuration: URLSessionConfiguration.default)
        self.URLReq=URLRequest(url:URL(string:"https://rss.itunes.apple.com/api/v1/in/ios-apps/top-free/all/10/explicit.json")!)
        self.URLReq?.httpMethod="GET"
        
        self.URLSDataTask=self.URLSObj?.dataTask(with: self.URLReq!, completionHandler: {(data,resp,err) in
            
            print(data!)
            do{
                let feedDic:[String:Any]=try
                    JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:Any]
                print(feedDic)
                var feed:[String:Any]=feedDic["feed"] as! [String:Any]
                //                let authorArry:[String:Any] = feed["author"] as! [String:Any]
                let results:[[String:Any]] = feed["results"] as! [[String:Any]]
                
                for i in 0..<results.count
                {
                    
                    var appdict:[String:Any]=results[i]
                    
                    self.appNamArry.append(appdict["name"] as! String)
                    self.imgArry.append(appdict["artworkUrl100"] as! String)
                    self.urlArry.append(appdict["url"] as! String)
                    self.artistArry.append(appdict["artistName"] as! String)
                    self.releaseDat.append(appdict["releaseDate"] as! String)
                }
                
            }catch
            {
                print("Something Went Wrong")
            }
            
        })
        
        self.URLSDataTask?.resume()
        
    }
    
    
    
    
}

