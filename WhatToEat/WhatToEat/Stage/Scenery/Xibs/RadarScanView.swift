//
//  RadarScanView.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/7/18.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

class RadarScanView: XibView {

    @IBOutlet weak var centerDot: UIView!
    @IBOutlet weak var radarImageView: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = self.view.backgroundColor
        self.layer.borderColor = self.view.layer.borderColor
        self.layer.cornerRadius = self.view.bounds.size.height/2;
        self.layer.cornerRadius = self.view.layer.cornerRadius;
        
        centerDot.backgroundColor = UIColor(red: 73.0/255.0, green: 143.0/255.0, blue: 225.0/255.0, alpha: 0.45)
        centerDot.layer.borderWidth = 3.0;
        centerDot.layer.borderColor = UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 226.0/255.0, alpha: 1.0).cgColor
        centerDot.layer.cornerRadius = centerDot.frame.size.height/2;
        centerDot.layer.masksToBounds = true;
    }
    
    func startRadarAnimation() {
        radarImageView.isHidden = false
        let fromAngle = 0.0
        let radarHand = CABasicAnimation(keyPath: "transform.rotation")
        radarHand.fromValue = fromAngle + Double.pi
        radarHand.byValue = (360.0 * .pi)/180.0
        radarHand.duration = 1.0
        radarHand.repeatCount = Float.infinity;
        radarImageView.layer.add(radarHand, forKey: "radarHand")
    }
    
    func stopRadarAnimation() {
        radarImageView.layer.removeAllAnimations()
        radarImageView.isHidden = true
    }
    
    func runSpinAnimation(view: UIView, duration: CGFloat,rotations: CGFloat, repeatCount: Float) {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = CGFloat(Double.pi * 2.0) * rotations * duration
        rotationAnimation.duration = CFTimeInterval(duration)
        rotationAnimation.isCumulative = true
        rotationAnimation.repeatCount = repeatCount
    }

}
