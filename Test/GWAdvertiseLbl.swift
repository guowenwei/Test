//
//  GWAdvertiseLbl.swift
//  Test
//
//  Created by 魏郭文 on 16/9/1.
//  Copyright © 2016年 魏郭文. All rights reserved.
//

import UIKit

class GWAdvertiseLbl: UIView, UIScrollViewDelegate {

    let ScreenWidth = UIScreen.mainScreen().bounds.size.width
    let ScreenHeight = UIScreen.mainScreen().bounds.size.height
    var scrollView = UIScrollView.init()
    var textLbl = UILabel.init()
    /// label的textColor
    var textColor:UIColor {
        get {
            return self.textLbl.textColor
        }
        set {
            self.textLbl.textColor = newValue
        }
    }
    /// 背景的颜色
    var backColor:UIColor {
        get {
            return self.scrollView.backgroundColor!
        }
        set {
            self.scrollView.backgroundColor = newValue
        }
    }
    
    init(frame: CGRect, dataStr: String)
    {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blueColor()
        self.addViews(frame, str: dataStr)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews(frame: CGRect, str: String)
    {
        //计算出宽度
        let width = GWAdvertiseLbl.getTextRectSize(str, font: UIFont.systemFontOfSize(17), size: CGSizeMake(ScreenWidth*100, ScreenHeight))

        /// textLbl的起始点，在屏幕的最右侧
        let startX = frame.size.width
        
        //scrollView
        self.scrollView = UIScrollView.init(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
        scrollView.delegate = self
        scrollView.contentSize = CGSizeMake(width+frame.origin.x, frame.size.height)
        scrollView.backgroundColor = UIColor.lightGrayColor()
        self.addSubview(scrollView)
        
        //textLbl
        self.textLbl = UILabel.init(frame: CGRectMake(startX, 0, width, frame.size.height))
        textLbl.textColor = UIColor.whiteColor()
        textLbl.text = str
        scrollView.addSubview(textLbl)
        
        //根据字符串大概估算一个用户可以接受的滚动速度
        weak var weakSelf = self
        let speed:NSTimeInterval = Double(width/50)
        UIView.animateKeyframesWithDuration(speed, delay: 2, options: .Repeat, animations: {
            weakSelf!.scrollView.contentOffset = CGPointMake(width+startX, 0)
            }) { (result) in
        }
    }
    
    //计算字符串宽度
    class func getTextRectSize(text:NSString,font:UIFont,size:CGSize) -> CGFloat {
        let attributes = [NSFontAttributeName: font]
        let option = NSStringDrawingOptions.UsesLineFragmentOrigin
        let rect:CGRect = text.boundingRectWithSize(size, options: option, attributes: attributes, context: nil)
        return rect.size.width;
    }
}
