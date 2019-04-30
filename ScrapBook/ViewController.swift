//
//  ViewController.swift
//  ScrapBook
//
//  Created by 矢野 義範 on 2019/04/30.
//  Copyright © 2019 矢野 義範. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    // 背景を透明にする
    override func viewWillAppear() {
        super.viewWillAppear()
        self.view.window?.isOpaque = false
        self.view.window?.backgroundColor = NSColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
    }
}
