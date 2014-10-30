//
//  Path.swift
//  FingerPaint
//
//  Created by Cee on 10/30/14.
//  Copyright (c) 2014 Cee. All rights reserved.
//

import Foundation
import UIKit

class Path {
    var points: [CGPoint] = []
    let color: UIColor
    init(color: UIColor) {
        self.color = color
    }
    
    func add(point: CGPoint) {
        points.append(point)
    }
}