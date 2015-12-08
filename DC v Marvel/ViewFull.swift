//
//  ViewFull.swift
//  DC v Marvel
//
//  Created by Shaswat Rao on Jun/23/15.
//  Copyright (c) 2015 Shaswat Rao. All rights reserved.
//

import UIKit

class ViewFull: UIViewController {
    
    var viewName: AnyObject? {
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("temp")
        }
    }

    @IBOutlet weak var FullImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println(viewName)
        FullImageView.image = UIImage(named: viewName as! String)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
