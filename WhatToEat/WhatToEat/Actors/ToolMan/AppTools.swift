//
//  AppTools.swift
//  WhatToEat
//
//  Created by YuCheng on 2021/2/23.
//  Copyright © 2021 YuCheng. All rights reserved.
//

import Foundation
import UIKit

func resizeImage(image: UIImage, width: CGFloat) -> UIImage {
    let size = CGSize(width: width, height:
                        image.size.height * width / image.size.width)
    let renderer = UIGraphicsImageRenderer(size: size)
    let newImage = renderer.image { (context) in
        image.draw(in: renderer.format.bounds)
    }
    return newImage
}
