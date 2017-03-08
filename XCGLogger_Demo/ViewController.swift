//
//  ViewController.swift
//  XCGLogger_Demo
//
//  Created by xiaohui on 2017/3/8.
//  Copyright © 2017年 xiaohui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        log.verbose("A verbose message, usually useful when working on a specific problem")
        log.debug("A debug message")
        log.info("An info message, probably useful to power users looking in console.app")
        log.warning("A warning message, may indicate a possible error")
        log.error("An error occurred, but it's recoverable, just info about what happened")
        log.severe("A severe error occurred, we are likely about to crash now")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

