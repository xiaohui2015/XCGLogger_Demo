//
//  ViewController.swift
//  XCGLogger_Demo
//
//  Created by xiaohui on 2017/3/8.
//  Copyright © 2017年 xiaohui. All rights reserved.
//

import UIKit

import XCGLogger

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        log.verbose("A verbose message, usually useful when working on a specific problem")
//        log.debug("A debug message")
//        log.info("An info message, probably useful to power users looking in console.app")
//        log.warning("A warning message, may indicate a possible error")
//        log.error("An error occurred, but it's recoverable, just info about what happened")
//        log.severe("A severe error occurred, we are likely about to crash now")
        
        
        //创建一个logger对象
        let log = XCGLogger(identifier: "advancedLogger", includeDefaultDestinations: false)
        
        //控制台输出
        let systemDestination = AppleSystemLogDestination(owner: log, identifier: "advancedLogger.systemDestination")
        
        //设置控制台输出的各个配置项
        systemDestination.outputLevel = .debug
        systemDestination.showLogIdentifier = false
        systemDestination.showFunctionName = true
        systemDestination.showThreadName = true
        systemDestination.showLevel = true
        systemDestination.showFileName = true
        systemDestination.showLineNumber = true
        systemDestination.showDate = true
        
        //logger对象中添加控制台输出
        log.add(destination: systemDestination)
        
        
        
        //日志文件地址
        let cachePath = FileManager.default.urls(for: .cachesDirectory,
                                                 in: .userDomainMask)[0]
        let logURL = cachePath.appendingPathComponent("log.txt")
        
        //文件出输出
        let fileDestination = FileDestination(writeToFile: logURL,
                                              identifier: "advancedLogger.fileDestination")
        
        //设置文件输出的各个配置项
        fileDestination.outputLevel = .debug
        fileDestination.showLogIdentifier = false
        fileDestination.showFunctionName = true
        fileDestination.showThreadName = true
        fileDestination.showLevel = true
        fileDestination.showFileName = true
        fileDestination.showLineNumber = true
        fileDestination.showDate = true
        
        //文件输出在后台处理
        fileDestination.logQueue = XCGLogger.logQueue
        
        //logger对象中添加控制台输出
        log.add(destination: fileDestination)
        
        //开始启用
        log.logAppDetails()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

