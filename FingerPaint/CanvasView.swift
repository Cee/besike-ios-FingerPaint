//
//  CanvasView.swift
//  FingerPaint
//
//  Created by Cee on 10/30/14.
//  Copyright (c) 2014 Cee. All rights reserved.
//

import UIKit

class CanvasView: UIView {
    
    let zigzag = [(100,100),
        (100,150),(150,150),
        (150,200)]
    
    var currentColor : UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var paths: [Path] = [Path]()
    var newPath : Path!

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    override func drawRect(rect: CGRect)
    {
        for path in paths{
            drawPath(path)
        }
        if (newPath != nil){
            drawPath(newPath)
        }

        
//        // Draw ZigZag
//        let context = UIGraphicsGetCurrentContext()
//        
//        var startX : CGFloat = -100
//        var startY : CGFloat = -100
//        
//        for (x, y) in zigzag{
//            var endX : CGFloat = CGFloat(x)
//            var endY : CGFloat = CGFloat(y)
//            if (startX != -100){
//                CGContextBeginPath(context)
//                CGContextMoveToPoint(context, startX, startY)
//                CGContextAddLineToPoint(context, endX, endY)
//                CGContextSetStrokeColorWithColor(context,UIColor.redColor().CGColor)
//                CGContextStrokePath(context)
//            }
//            startX = endX
//            startY = endY
//        }

        
        
//        // Get the drawing context.
//        let context = UIGraphicsGetCurrentContext()
//        
//        // Create the shape (a vertical line) in the context.
//        CGContextBeginPath(context)
//        CGContextMoveToPoint(context, 10, 0)
//        CGContextAddLineToPoint(context, 10, 200)
//        
//        // Configure the drawing environment.
//        CGContextSetStrokeColorWithColor(context,UIColor.redColor().CGColor)
//        
//        // Request the system to draw.
//        CGContextStrokePath(context)
        
        
    }
    
//    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
//        let t = touches.anyObject() as UITouch
//        let point = t.locationInView(self)
//        println("touch: \(point)")
//    }
    
    func drawPath(path: Path) {
        let context = UIGraphicsGetCurrentContext()
        
        var startX : CGFloat = -100
        var startY : CGFloat = -100
        
        for point : CGPoint in path.points{
            var endX : CGFloat = CGFloat(point.x)
            var endY : CGFloat = CGFloat(point.y)
            if (startX != -100){
                CGContextBeginPath(context)
                CGContextMoveToPoint(context, startX, startY)
                CGContextAddLineToPoint(context, endX, endY)
                //                    CGContextSetStrokeColorWithColor(context,currentColor.CGColor)
                CGContextSetStrokeColorWithColor(context, path.color.CGColor)
                CGContextStrokePath(context)
            }
            startX = endX
            startY = endY
        }

    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        // TODO: Start a new path, and add the starting touch point to it.
        newPath = Path(color: currentColor)
        println("new Line")
        let t = touches.anyObject() as UITouch
        let point = t.locationInView(self)
        newPath.add(point)
        println("touch: \(point)")
        setNeedsDisplay()
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        // TODO: Add a new touch point to the path
        let t = touches.anyObject() as UITouch
        let point = t.locationInView(self)
        newPath.add(point)
        println("touch: \(point)")
        setNeedsDisplay()
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        // TODO: Add the end touch point
        let t = touches.anyObject() as UITouch
        let point = t.locationInView(self)
        newPath.add(point)
        paths.append(newPath)
        println("touch: \(point)")
        setNeedsDisplay()
    }
}
