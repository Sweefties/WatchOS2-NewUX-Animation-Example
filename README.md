![](https://img.shields.io/badge/build-pass-brightgreen.svg?style=flat-square)
![](https://img.shields.io/badge/platform-WatchOS2-ff69b4.svg?style=flat-square)
![](https://img.shields.io/badge/Require-XCode%208-lightgrey.svg?style=flat-square)


# WatchOS2 - New UX - Animation - Example
WatchOS 2 Experiments - New API Components - Animation with duration.

## Example

![](https://raw.githubusercontent.com/Sweefties/WatchOS2-NewUX-Animation-Example/master/source/Apple_Watch_template-Animations.jpg)


## Requirements

- >= XCode 8.0.
- >= Swift 3.

Tested on WatchOS2 Simulators, Apple Watch.

## Important

this is the Xcode 8 / Swift 3 updated project.

## Usage

To run the example project, download or clone the repo.


### Example Code!


Configure :

- Drag and drop more WKInterfaceButton to Interface Controller (Storyboard)
- connect your WKInterfaceButton to your Interface Controller class
- define your WKInterfaceButton IBAction
- put code to your controller class.


```swift
// Interface Group to animate
@IBOutlet var bubbleGroup: WKInterfaceGroup!
```

- Properties

```swift
private let duration = 0.5
private let alphaTimer = 1.0
```

- IBAction examples

```swift
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
```


Build and Run!
