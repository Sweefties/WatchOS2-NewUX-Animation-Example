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
    fileprivate let duration = 0.5
    fileprivate let alphaTimer = 1.0
    
    
    // MARK: - Context Initializer
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        self.animate(withDuration: duration) { () -> Void in
            self.bubbleGroup.setVerticalAlignment(WKInterfaceObjectVerticalAlignment.top)
            self.bubbleGroup.setHorizontalAlignment(WKInterfaceObjectHorizontalAlignment.center)
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
        self.animate(withDuration: duration) { () -> Void in
            self.bubbleGroup.setHorizontalAlignment(WKInterfaceObjectHorizontalAlignment.left)
        }
    }
    // move bubble to the right
    @IBAction func moveRightButton() {
        self.animate(withDuration: duration) { () -> Void in
            self.bubbleGroup.setHorizontalAlignment(WKInterfaceObjectHorizontalAlignment.right)
        }
    }
    // move bubble to the top
    @IBAction func moveUpButton() {
        self.animate(withDuration: duration) { () -> Void in
            self.bubbleGroup.setVerticalAlignment(WKInterfaceObjectVerticalAlignment.top)
        }
    }
    // move bubble to the bottom
    @IBAction func moveDownButton() {
        self.animate(withDuration: duration) { () -> Void in
            self.bubbleGroup.setVerticalAlignment(WKInterfaceObjectVerticalAlignment.bottom)
        }
    }
    // move bubble to the center (screen)
    @IBAction func moveCenterButton() {
        self.animate(withDuration: duration) { () -> Void in
            self.bubbleGroup.setHorizontalAlignment(WKInterfaceObjectHorizontalAlignment.center)
            self.bubbleGroup.setVerticalAlignment(WKInterfaceObjectVerticalAlignment.center)
        }
    }
    // animate bubble with alpha
    @IBAction func changeAlphaButton() {
        self.animate(withDuration: alphaTimer) { () -> Void in
            self.bubbleGroup.setAlpha(0)
        }
        let completionDelay = DispatchTime.now() + Double(Int64(alphaTimer * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: completionDelay) {
            self.animate(withDuration: self.alphaTimer, animations: { () -> Void in
                self.bubbleGroup.setAlpha(1)
            })
        }
        
    }
    
}
