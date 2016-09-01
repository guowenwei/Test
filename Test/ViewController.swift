//
//  ViewController.swift
//  Test
//
//  Created by 魏郭文 on 16/8/15.
//  Copyright © 2016年 魏郭文. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lbl = GWAdvertiseLbl.init(frame: CGRectMake(50, 200, self.view.frame.size.width-50, 40), dataStr: "这是一条弹幕这是一条")
        lbl.textColor = UIColor.blueColor()//textColor默认是whiteColor
        lbl.backColor = UIColor.blackColor()//backColor默认是lightGaryColor
        self.view.addSubview(lbl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

