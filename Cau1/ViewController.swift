//
//  ViewController.swift
//  Cau1
//
//  Created by Cntt22 on 7/5/17.
//  Copyright © 2017 Cntt22. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var inactiveQueue : DispatchQueue!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func test1(_ sender: UIButton) {
        let anotherQueue = DispatchQueue(label: "anotherQueue", qos: .utility, attributes: .concurrent)
        inactiveQueue = anotherQueue
        anotherQueue.async {
            for i in 0..<10
            {
                print("🔴",i)
            }
        }
        anotherQueue.async {
            for i in 100..<110
            {
                print("🔵",i)
            }
        }
        anotherQueue.async {
            for i in 1000..<1010
            {
                print("⚫",i)
            }
        }
    }
    
    @IBAction func test2(_ sender: UIButton) {
        let Queue1 = DispatchQueue(label: "Queue1", qos: .utility, attributes: [.concurrent, .initiallyInactive])
        let Queue2 = DispatchQueue(label: "Queue2", qos: .utility, attributes: [.concurrent, .initiallyInactive])
        let Queue3 = DispatchQueue(label: "Queue3", qos: .utility, attributes: [.concurrent, .initiallyInactive])
        Queue1.activate()
        Queue2.activate()
        Queue3.activate()
        
        Queue1.async {
            for i in 0..<10
            {
                print("🔴",i)
            }
        }
        
        Queue2.async {
            for i in 100..<110
            {
                print("🔵",i)
            }
        }
        
        Queue3.async {
            for i in 1000..<1010
            {
                print("⚫",i)
            }
        }
    }
}

