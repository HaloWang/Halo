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
        
        UIImageView()
            .superView(view)
            .frame(x: 50, y: 50, width: 100, height: 100)
            .image(named: "Icon")
        
        let iv = UIImageView()
            .superView(view)
            .frame(x: 160, y: 160, width: 375/4, height: 667/4)
        
        view.screenshot {
            iv.image($0)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

