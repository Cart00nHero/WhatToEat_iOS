//
//  XibSetupView.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/20.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

@IBDesignable
class XibView: UIView {

    @IBOutlet weak var view: UIView!

    var icSize: CGSize!

    override init(frame: CGRect) {
        // 1. setup any properties here

        // 2. call super.init(frame:)
        super.init(frame: frame)

        // 3. Setup view from .xib file
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        // 1. setup any properties here

        // 2. call super.init(coder:)
        super.init(coder: aDecoder)

        // 3. Setup view from .xib file
        xibSetup()
    }

    func xibSetup() {
        if self.subviews.count == 0 {
            view = loadViewFromNib()

            // use bounds not frame or it'll be offset
            self.view.frame = self.bounds
            self.icSize = self.bounds.size

            // Make the view stretch with containing view
            view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]

            // Adding custom subview on top of our view (over any custom drawing > see note below)
            addSubview(view)
        }
    }

    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)

        // Assumes UIView is top level and only object in CustomView.xib file
        let view = (nib.instantiate(withOwner: self, options: nil)[0] as? UIView)!
        return view
    }

    override var intrinsicContentSize: CGSize {
        return icSize
    }
    
}
