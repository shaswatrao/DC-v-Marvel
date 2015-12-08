//
//  TableTabController.swift
//  
//
//  Created by Shaswat Rao on Jun/22/15.
//
//

import UIKit

class TableTabController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var TableName: AnyObject? {
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("TableName")
        }
        set{
            NSUserDefaults.standardUserDefaults().setObject(newValue!, forKey: "TableName")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }

    let marvelTeam = [
        ("Captain America", "Coordinator"),
        ("Iron Man","Technology & Finance"),
        ("Thor", "Aerial Support"),
        ("Storm","Aerial Support"),
        ("Hulk", "Ground Assault"),
        ("Deadpool","Ground Assault"),
        ("Spider Man","Search & Rescue"),
        ("Wolverine","Tactician"),
        ("Jean Grey","Tactician"),
        ("Susan Storm","Infiltration")]
    
    let dcTeam = [
        ("Batman","Coordinator"),
        ("The Atom","Technology & Finance"),
        ("Superman","Aerial Support"),
        ("Hawkgirl","Aerial Support"),
        ("Green Lantern","Ground Assault"),
        ("Wonder Woman","Ground Assault"),
        ("Flash","search & Rescue"),
        ("Rorschach","Tactician"),
        ("John Constantine","Tactician"),
        ("Martian Manhunter","Infiltration")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {   
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return marvelTeam.count
        }
        else {
            return dcTeam.count
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        //var cell :UITableViewCell = UITableViewCel
        
        if indexPath.section == 0 {
            var (marvelName, marvelDesignation) = marvelTeam[indexPath.row]
            cell.textLabel?.text = marvelName
            cell.detailTextLabel?.text = marvelDesignation
            cell.imageView?.image = UIImage(named: (marvelName+".png"))
        }
        else {
            var (dcName, dcDesignation) = dcTeam[indexPath.row]
            cell.textLabel?.text = dcName
            cell.detailTextLabel?.text = dcDesignation
            cell.imageView?.image = UIImage(named: (dcName+".png"))
        }
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Marvel"
        }
        else {
            return "DC"
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            var (marvelName, marvelDesignation) = marvelTeam[indexPath.row]
            TableName = marvelName + " Full.png"
            println(TableName)
        }
        else {
            var (dcName, dcDesignation) = dcTeam[indexPath.row]
            TableName = dcName + " Full.png"
            println(TableName)
        }
        performSegueWithIdentifier("showFull", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController : TableFull = segue.destinationViewController as! TableFull
        println(TableName as! String)
    }
}
