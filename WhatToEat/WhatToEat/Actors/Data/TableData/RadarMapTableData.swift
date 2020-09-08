//
//  RadarMapTableData.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/7/25.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import MapKit

struct RadarMapTableData: CellDataProtocol {
    var templateStyle: CellTemplateStyle = .RadarMap
    var annotations: [MKPointAnnotation] = []
}
