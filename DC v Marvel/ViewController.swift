//
//  ViewController.swift
//  DC v Marvel
//
//  Created by Shaswat Rao on Jun/22/15.
//  Copyright (c) 2015 Shaswat Rao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var teamName: [String] = []
    var teamDesignation: [String] = []
    var FullImageName: [String] = []
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    var temp: AnyObject? {
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("temp")
        }
        set {
            NSUserDefaults.standardUserDefaults().setObject(newValue!, forKey: "temp")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        teamName = ["Captain America","Iron Man","Thor","Storm","Hulk","Deadpool","Spider Man","Wolverine","Jean Grey","Susan Storm","Batman","The Atom","Superman","Hawkgirl","Green Lantern","Wonder Woman","Flash","Rorschach","John Constantine","Martian Manhunter"]
        
        teamDesignation = ["Coordinator","Technology & Finanace","Aerial Support","Aerial Support","Ground Asault","Ground Assault","Search & Rescue","Tactician","Tactician","Infiltration","Coordinator","Technology & Finanace","Aerial Support","Aerial Support","Ground Asault","Ground Assault","Search & Rescue","Tactician","Tactician","Infiltration"]
        
        FullImageName = ["Captain America Full.png","Iron Man Full.png","Thor Full.png","Storm Full.png","Hulk Full.png","Deadpool Full.png","Spider Man Full.png","Wolverine Full.png","Jean Grey Full.png","Susan Storm Full.png","Batman Full.png","The Atom Full.png","Superman Full.png","Hawkgirl Full.png","Green Lantern Full.png","Wonder Woman Full.png","Flash Full.png","Rorschach Full.png","John Constantine Full.png","Martian Manhunter Full.png"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamName.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionCell
        cell.CellLabel.text = teamName[indexPath.row]
        cell.CellDetail.text = teamDesignation[indexPath.row]
        cell.CellImage.image = UIImage(named: (teamName[indexPath.row]+".png"))
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.lightGrayColor().CGColor
        cell.frame.size.width = 105
        cell.frame.size.height = 143
        cell.layer.cornerRadius = 5
        return cell
    }
    

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        temp = FullImageName[indexPath.row]
        println(temp)
    }
}
