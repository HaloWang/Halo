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
        
        let _ = "2015-11-13 15:27:00"
        
        Async {
            print("⚠️")
            Last {
                print("✅")
            }
        }
        
        dispatch_async(dispatch_queue_create("", nil)) {
            print("⚠️")
            dispatch_async(dispatch_get_main_queue()) {
                print("✅")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

