//
//  ViewController.swift
//  Halo
//
//  Created by HaloWang on 04/25/2018.
//  Copyright (c) 2018 HaloWang. All rights reserved.
//

import UIKit
import Halo

// MARK: - Properties & Init
class ViewController: UIViewController {
    let v = UIView()
}

// MARK: - Lifecycle
extension ViewController {
    
    override func loadView() {
        super.loadView()
        
        v
            .superView(view)
            .backgroundColor(.red)
            .cornerRadius(15, borderWidth: 5, borderColor: UIColor.red.alpha(0.5))
            .frame(x: 100, y: 100, width: 100, height: 100)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

// MARK: - Methods
extension ViewController {
    
}