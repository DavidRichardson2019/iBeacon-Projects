//
//  FirstViewController.swift
//  iBeaconProximityFinder
//
//  Created by David Richardson on 2/16/17.
//  Copyright © 2017 DTSE Swift Coders. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var identifierTxt: UITextField!
    @IBOutlet weak var MaximumTxt: UITextField!
    @IBOutlet weak var minimumTXT: UITextField!
    @IBOutlet weak var uuidTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        identifierTxt.resignFirstResponder()
        MaximumTxt.resignFirstResponder()
        minimumTXT.resignFirstResponder()
        uuidTxt.resignFirstResponder()
    }
    @IBAction func startFinding(_ sender: UIButton) {
        var rangeViewController = RangeViewController()
        rangeViewController.uuid = uuidTxt.text!
        rangeViewController.major = Int(MaximumTxt.text!)!
        rangeViewController.minor = Int(minimumTXT.text!)!
        rangeViewController.identifier = identifierTxt.text!
        
        self.present(rangeViewController, animated: true, completion: nil)
    }
}
