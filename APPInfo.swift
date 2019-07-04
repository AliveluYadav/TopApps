//
//  APPInfo.swift
//  TopApps
//
//  Created by Alivelu Ravula on 4/23/18.
//  Copyright © 2018 Roja. All rights reserved.
//

import UIKit

class APPInfo: UIViewController {

    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var artistNam: UILabel!
    @IBOutlet weak var url: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imgeeee: UIImageView!
    
    
    var appstrng=String()
    var nameStrng=String()
    var urlStrng=String()
    var relesStrng=String()
    var artistStrng=String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.name.text = "AppName:"+nameStrng
        self.artistNam.text="ArtistName"+artistStrng
        self.url.text="URL:"+urlStrng
        self.releaseDate.text="ReleaseDate:"+relesStrng
       
        // for image
        if let url = URL(string: appstrng) {
            if let data = NSData(contentsOf: url) {
               self.imgeeee.image = UIImage(data: data as Data)
            }
            
        // Do any additional setup after loading the view.
    }

        func didReceiveMemoryWarning() {
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
}
