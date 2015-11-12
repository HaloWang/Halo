//
//  ViewController.swift
//  HaloDemo
//
//  Created by 王策 on 15/11/10.
//  Copyright © 2015年 WangCe. All rights reserved.
//

import UIKit
import Halo

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView()
            .superView(view)
            .backgroundColor(Red)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

