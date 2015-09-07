//
//  InterfaceController.swift
//  WatchOS2-NewUX-Animation-Example WatchKit Extension
//
//  Created by Wlad Dicario on 07/09/2015.
//  Copyright © 2015 Sweefties. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    // MARK: - Interface
    @IBOutlet var bubbleGroup: WKInterfaceGroup!
    @IBOutlet var leftButton: WKInterfaceButton!
    @IBOutlet var rightButton: WKInterfaceButton!
    @IBOutlet var topButton: WKInterfaceButton!
    @IBOutlet var bottomButton: WKInterfaceButton!
    @IBOutlet var centerButton: WKInterfaceButton!
    @IBOutlet var alphaButton: WKInterfaceButton!
    
    
    // MARK: - Properties
    private let duration = 0.5
    private let alphaTimer = 1.0
    
    
    // MARK: - Context Initializer
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
        self.animateWithDuration(duration) { () -> Void in
            self.bubbleGroup.setVerticalAlignment(WKInterfaceObjectVerticalAlignment.Top)
            self.bubbleGroup.setHorizontalAlignment(WKInterfaceObjectHorizontalAlignment.Center)
        }
    }

    
    // MARK: - Calls
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}


//MARK: - Actions -> InterfaceController Extension
typealias Actions = InterfaceController
extension Actions {
    
    // move bubble to the left
    @IBAction func moveLeftButton() {
        self.animateWithDuration(duration) { () -> Void in
            self.bubbleGroup.setHorizontalAlignment(WKInterfaceObjectHorizontalAlignment.Left)
        }
    }
    // move bubble to the right
    @IBAction func moveRightButton() {
        self.animateWithDuration(duration) { () -> Void in
            self.bubbleGroup.setHorizontalAlignment(WKInterfaceObjectHorizontalAlignment.Right)
        }
    }
    // move bubble to the top
    @IBAction func moveUpButton() {
        self.animateWithDuration(duration) { () -> Void in
            self.bubbleGroup.setVerticalAlignment(WKInterfaceObjectVerticalAlignment.Top)
        }
    }
    // move bubble to the bottom
    @IBAction func moveDownButton() {
        self.animateWithDuration(duration) { () -> Void in
            self.bubbleGroup.setVerticalAlignment(WKInterfaceObjectVerticalAlignment.Bottom)
        }
    }
    // move bubble to the center (screen)
    @IBAction func moveCenterButton() {
        self.animateWithDuration(duration) { () -> Void in
            self.bubbleGroup.setHorizontalAlignment(WKInterfaceObjectHorizontalAlignment.Center)
            self.bubbleGroup.setVerticalAlignment(WKInterfaceObjectVerticalAlignment.Center)
        }
    }
    // animate bubble with alpha
    @IBAction func changeAlphaButton() {
        self.animateWithDuration(alphaTimer) { () -> Void in
            self.bubbleGroup.setAlpha(0)
        }
        let completionDelay = dispatch_time(DISPATCH_TIME_NOW, Int64(alphaTimer * Double(NSEC_PER_SEC)))
        dispatch_after(completionDelay, dispatch_get_main_queue()) {
            self.animateWithDuration(self.alphaTimer, animations: { () -> Void in
                self.bubbleGroup.setAlpha(1)
            })
        }
        
    }
    
}
