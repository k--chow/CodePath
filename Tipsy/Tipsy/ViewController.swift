//
//  ViewController.swift
//  Tipsy
//
//  Created by Kevin Chow on 12/19/15.
//  Copyright © 2015 Kevin Chow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var customTipField: UITextField!
    @IBOutlet weak var tipPercent: UISegmentedControl!
    var tipPercentage : Double = 0.0
    
    let defaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "$0.00";
        totalLabel.text = "$0.00";
        if let defaultTip = defaults.stringForKey("defaultTip")
        {
            tipControl.selectedSegmentIndex = -1
            tipPercentage = (NSString(string:defaultTip).doubleValue)/100
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onEditingChanged(sender: AnyObject) {
        var billAmount = NSString(string: billField.text!).doubleValue
        var tipPercentages = [0.18, 0.2, 0.22]
        if (tipControl.selectedSegmentIndex != -1)
        {
        tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        }
        else if(customTipField.text != ""){
        tipPercentage = (NSString(string:customTipField.text!).doubleValue)/100
        }
        else
        {
            if let defaultTip = defaults.stringForKey("defaultTip")
            {
                //tipControl.selectedSegmentIndex = -1
                tipPercentage = (NSString(string:defaultTip).doubleValue)/100
            }

        }
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        tipLabel.text = "$\(billAmount)";
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
        tipControl.setEnabled(true , forSegmentAtIndex: 0)
        tipControl.setEnabled(true , forSegmentAtIndex: 1)
        tipControl.setEnabled(true , forSegmentAtIndex: 2)
    }
    @IBAction func fieldTapped(sender: AnyObject) {
        self.view.backgroundColor = UIColor.lightGrayColor()
    }
    @IBAction func fieldUntapped(sender: AnyObject) {
        self.view.backgroundColor = UIColor.whiteColor()
    }
    @IBAction func customTapped(sender: AnyObject) {

        tipControl.setEnabled(false , forSegmentAtIndex: 0)
        tipControl.setEnabled(false , forSegmentAtIndex: 1)
        tipControl.setEnabled(false , forSegmentAtIndex: 2)
    }
    
    @IBAction func customEditingChanged(sender: AnyObject) {
        var billAmount = NSString(string: billField.text!).doubleValue
        tipPercentage = (NSString(string:customTipField.text!).doubleValue)/100
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        tipLabel.text = "$\(billAmount)";
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    

}

