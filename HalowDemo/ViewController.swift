//
//  ViewController.swift
//  HalowDemo
//
//  Created by 王策 on 15/9/3.
//  Copyright (c) 2015年 WangCe. All rights reserved.
//

import UIKit
import Halo

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v = UIView()
        addSubview(v)
        v.frame = ScreenBounds
        v.backgroundColor(UIColor(red: 0.1, green: 0.9, blue: 0.8, alpha: 1).alpha(0.1))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

