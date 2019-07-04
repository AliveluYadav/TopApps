//
//  APPsDisplayTVC.swift
//  TopApps
//
//  Created by Alivelu Ravula on 4/19/18.
//  Copyright © 2018 Roja. All rights reserved.
//

import UIKit

class APPsDisplayTVC: UITableViewController {

    var appArryInTbl=[String]()
    var imgArryInTbl=[String]()
    
    @IBOutlet var TVC: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
     

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return appArryInTbl.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        cell.appLbl.text=appArryInTbl[indexPath.row]
//        cell.appImg.image = UIImage(named: imgArryInTbl[indexPath.row])
        
        
        if let url = URL(string: imgArryInTbl[indexPath.row]) {
            if let data = NSData(contentsOf: url) {
                cell.appImg?.image = UIImage(data: data as Data)
            }
            
            
        }
        

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let storyboard=UIStoryboard(name: "Main", bundle: nil)
        let appinfo=storyboard.instantiateViewController(withIdentifier: "APPInfo") as! APPInfo
        
    appinfo.appstrng =  imgArryInTbl[indexPath.row]
        appinfo.nameStrng=appArryInTbl[indexPath.row]
        
        
        
        self.navigationController?.pushViewController(appinfo, animated: true)
        
        
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
