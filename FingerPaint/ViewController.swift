//
//  ViewController.swift
//  FingerPaint
//
//  Created by Cee on 10/30/14.
//  Copyright (c) 2014 Cee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var canvasView: CanvasView!
    weak var touchedButton : UIButton!
    weak var clearButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let screen = UIScreen.mainScreen()
        let canvasView = CanvasView(frame: CGRect(x: 0, y: 0, width: screen.bounds.width, height: screen.bounds.height))
        self.canvasView = canvasView
        self.canvasView.backgroundColor = UIColor.whiteColor()
        
        // Add the canvas view to the root view.
        self.view.addSubview(canvasView)
        setupColorPickers()
        setupClearButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupColorPickers() {
        // Colors for the pickers.
        // Or you can choose a color scheme you like: https://kuler.adobe.com/explore/most-popular/
        let colors : [UIColor] = [
            // 0x000000
            UIColor(red: 0, green: 0, blue: 0, alpha: 1),
            // 0x17A3A5
            UIColor(red: 0x17/255.0, green: 0xA3/255.0, blue: 0xA5/255.0, alpha: 1),
            // 0x8DBF67
            UIColor(red: 0x8D/255.0, green: 0xBF/255.0, blue: 0x67/255.0, alpha: 1),
            // 0xFCCB5F
            UIColor(red: 0xFC/255.0, green: 0xCB/255.0, blue: 0x5F/255.0, alpha: 1),
            // 0xFC6E59
            UIColor(red: 0xFC/255.0, green: 0x6E/255.0, blue: 0x59/255.0, alpha: 1),
        ]
        
        
        // (x,y)
        let positions = [
            (33,43),(86,43),(138,43),(190,43),(242,43)
        ]
        
        // size
        let size = (44,44)
        
        // TODO: Create UIButton and add them to the view hierarchy
        for i in 0...4 {
            var button = UIButton(frame: CGRect(x: positions[i].0, y: positions[i].1, width: size.0, height: size.1))
            button.backgroundColor = colors[i]
            button.layer.shadowRadius = 0
            button.addTarget(self, action: "colorPickerTapped:", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(button)
            if (i == 0) {
                touchedButton = button
            }

        }
    }
    
    func colorPickerTapped(button: UIButton) {
        touchedButton.layer.shadowRadius = 0
        println("tapped: \(button.backgroundColor)")
        canvasView.currentColor = button.backgroundColor!
        button.layer.shadowColor = UIColor(white: 0.4, alpha: 1).CGColor
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 3
        button.layer.shadowOpacity = 1
        touchedButton = button
    }
    
    func setupClearButton() {
        let button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        self.clearButton = button
        button.frame = CGRect(x: 267, y: 518, width: 37, height: 30)
        button.setTitle("Clear", forState: UIControlState.Normal)
        
        // TODO: create a target-action to clear the canvas
        button.addTarget(self, action: "clearAll:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
    }
    
    func clearAll(button: UIButton){
        canvasView.paths.removeAll()
        canvasView.newPath = nil
        canvasView.setNeedsDisplay()
    }

}

