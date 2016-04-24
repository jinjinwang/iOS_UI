//
//  ViewController.swift
//  swiftStudy
//
//  Created by jinjinwang on 16/4/24.
//  Copyright © 2016年 jinjinwang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /**
     动作与输出口：在Main.storyboard中选中控件，按住control键，用鼠标拖拽到类内部，松开鼠标
     */
    @IBOutlet weak var label: UILabel!
    
    @IBAction func onClick(sender: UIButton) {
        self.label.text = "Hello world!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

