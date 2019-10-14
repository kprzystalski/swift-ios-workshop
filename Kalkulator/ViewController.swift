//
//  ViewController.swift
//  Kalkulator
//
//  Created by kprzystalski on 14/10/2019.
//  Copyright © 2019 kprzystalski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var przcysik: UIButton!
    
    @IBOutlet weak var dane: UITextField!
    
    var zmienna: String = "";
    var zmienna1: Int = 0;
    
    @IBAction func doWork(sender: UIButton){
        print(self.dane.text ?? "");
        self.zmienna = self.dane.text!;
        self.zmienna1 = Int(self.dane.text!) ?? 0;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
