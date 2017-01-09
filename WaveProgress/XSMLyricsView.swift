//
//  XSMLyricsView.swift
//  WaveProgress
//
//  Created by xss@ttyhuo.cn on 2017/1/9.
//  Copyright © 2017年 xss@ttyhuo.cn. All rights reserved.
//

import UIKit

class XSMLyricsView: UIView {
    
    let label: UILabel = UILabel();
    private let lyricsLabel: UILabel = UILabel();
    private let lyricsLayer: CALayer = CALayer();
    private let labelLayer: CALayer = CALayer();
    
    var text: String? {
        didSet {
            label.text = text;
            if (lyricsText == nil || lyricsText == "") {
                lyricsLabel.text = text;
            }
        }
    }
    var textColor: UIColor? {
        didSet {
            label.textColor = textColor;
        }
    };
    
    var font: UIFont? {
        didSet {
            label.font = font;
            lyricsLabel.font = font;
        }
    };
    var lyricsColor: UIColor = UIColor.purple {
        didSet {
            lyricsLabel.textColor = lyricsColor;
        }
    }
    var lyricsText: String? {
        didSet {
            lyricsLabel.text = lyricsText;
        }
    }
    
    override var frame: CGRect {
        didSet {
            lyricsLayer.bounds = CGRect(x: 0, y: 0, width: 0, height: frame.size.height);
            labelLayer.bounds = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
            
            lyricsLayer.position = CGPoint(x: 0, y: frame.size.height / 2);
            labelLayer.position = CGPoint(x: frame.size.width, y: frame.size.height / 2)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.backgroundColor = UIColor.yellow;
        self.addSubview(label);
        self.addSubview(lyricsLabel);
        
        label.translatesAutoresizingMaskIntoConstraints = false;
        lyricsLabel.translatesAutoresizingMaskIntoConstraints = false;
        
        let left1 = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 0);
        let right1 = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.right, multiplier: 1, constant: 0);
        let top1 = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0);
        let bottom1 = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0);
        
        let left2 = NSLayoutConstraint(item: lyricsLabel, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 0);
        let right2 = NSLayoutConstraint(item: lyricsLabel, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.right, multiplier: 1, constant: 0);
        let top2 = NSLayoutConstraint(item: lyricsLabel, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0);
        let bottom2 = NSLayoutConstraint(item: lyricsLabel, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0);
        left1.isActive = true;
        right1.isActive = true;
        top1.isActive = true;
        bottom1.isActive = true;
        left2.isActive = true;
        right2.isActive = true;
        top2.isActive = true;
        bottom2.isActive = true;
        
        lyricsLabel.textColor = lyricsColor;
        
        lyricsLabel.layer.mask = lyricsLayer;
        
        lyricsLayer.anchorPoint = CGPoint(x: 0, y: 0.5);
        lyricsLayer.position = CGPoint(x: 0, y: frame.size.height / 2);
        lyricsLayer.bounds = CGRect(x: 0, y: 0, width: 0, height: frame.size.height);
        lyricsLayer.backgroundColor = UIColor.white.cgColor;
        
        
        labelLayer.anchorPoint = CGPoint(x: 1, y: 0.5);
        labelLayer.position = CGPoint(x: frame.size.width, y: frame.size.height / 2)
        labelLayer.bounds = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        labelLayer.backgroundColor = UIColor.white.cgColor;
        label.layer.mask = labelLayer;
    }
    
    public func startAnimate() {
        
        let totalDuration: Float = 4;
        let timeArray: Array<Float> = [0,3, 3.3, 3.6, 4];
        let locationArray: Array<Float> = [0, 0.4, 0.6, 0.8, 1];
        
        let animate: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "bounds.size.width");
        var keyTimeArray = [NSNumber]();
        var keyLocationArray = [NSNumber]();
        var keyLocationArray1 = [NSNumber]();
        
        for (index, time) in timeArray.enumerated() {
            let tempTime = time / totalDuration;
            let tempLocation = locationArray[index] * Float(self.frame.size.width);
            keyTimeArray.append(NSNumber(value: tempTime));
            keyLocationArray.append(NSNumber(value: tempLocation));
            
            let tempLocation1 = (1.0 - locationArray[index]) * Float(self.frame.size.width)
            keyLocationArray1.append(NSNumber(value: tempLocation1))
            
        }
        animate.values = keyLocationArray;
        animate.keyTimes = keyTimeArray;
        animate.duration = CFTimeInterval(totalDuration);
        animate.calculationMode = kCAAnimationLinear;
        animate.fillMode = kCAFillModeForwards;
        animate.isRemovedOnCompletion = false;
        self.lyricsLayer.add(animate, forKey: "key");
        
        let animate1: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "bounds.size.width");
        
        for (index, time) in timeArray.enumerated() {
            let tempTime = time / totalDuration;
            let tempLocation = locationArray[index] * Float(self.frame.size.width);
            keyTimeArray.append(NSNumber(value: tempTime));
            keyLocationArray.append(NSNumber(value: tempLocation));
        }
        animate1.values = keyLocationArray1;
        animate1.keyTimes = keyTimeArray;
        animate1.duration = CFTimeInterval(totalDuration);
        animate1.calculationMode = kCAAnimationLinear;
        animate1.fillMode = kCAFillModeForwards;
        animate1.isRemovedOnCompletion = false;
        self.labelLayer.add(animate1, forKey: "key");
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
