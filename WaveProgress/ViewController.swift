//
//  ViewController.swift
//  WaveProgress
//
//  Created by xss@ttyhuo.cn on 2017/1/9.
//  Copyright © 2017年 xss@ttyhuo.cn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let lyriceView = XSMLyricsView(frame: CGRect(x: 15, y: 100, width: 300, height: 20));
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        lyriceView.font = UIFont.systemFont(ofSize: 20);
        lyriceView.textColor = UIColor.blue;
        lyriceView.text = "好好好好好好好好好好好好好"
        lyriceView.lyricsColor = UIColor.red;
        lyriceView.lyricsText = "难难难难难难难难难难难难";
        self.view.addSubview(lyriceView);
        
        let btn = UIButton(type: UIButtonType.custom);
        btn.setTitle("begin", for: UIControlState.normal);
        btn.frame = CGRect(x: 30, y: 200, width: 50, height: 40);
        btn.backgroundColor = UIColor.blue;
        btn.addTarget(self, action: #selector(beginAnimate), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn);
        
    }
    func beginAnimate() {
        lyriceView.startAnimate();
    }
}

