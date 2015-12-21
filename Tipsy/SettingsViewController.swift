//
//  SettingsViewController.swift
//  Tipsy
//
//  Created by Kevin Chow on 12/20/15.
//  Copyright © 2015 Kevin Chow. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipPercent: UITextField!
    let defaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let defaultTip = defaults.stringForKey("defaultTip")
        {
            defaultTipPercent.text = defaultTip
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func defaultTipChanged(sender: AnyObject) {
        if (defaultTipPercent.text != "")
        {
            defaults.setObject(defaultTipPercent.text, forKey: "defaultTip")
            let tip = defaults.stringForKey("defaultTip");
            print(tip)
        }
        
        
    }

    

   
}
