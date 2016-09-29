//
//  ViewController.swift
//  swiftStudy
//
//  Created by jinjinwang on 16/4/24.
//  Copyright © 2016年 jinjinwang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    /**
     * 文本类控件
     */
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    
    /**
     * 动作与输出口：在Main.storyboard中选中控件，按住control键，用鼠标拖拽到类内部，松开鼠标
     */
    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func onClick(_ sender: UIButton) {
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
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n"){
            textView.resignFirstResponder()
            return false
        }
        return true
    }


}

