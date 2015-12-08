//
//  TableFull.swift
//  DC v Marvel
//
//  Created by Shaswat Rao on Jun/24/15.
//  Copyright (c) 2015 Shaswat Rao. All rights reserved.
//

import UIKit

class TableFull: UIViewController {
    @IBOutlet weak var TableFullImage: UIImageView!
    
    var nameDetail : AnyObject? {
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("TableName")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableFullImage.image = UIImage(named: nameDetail as! String)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
