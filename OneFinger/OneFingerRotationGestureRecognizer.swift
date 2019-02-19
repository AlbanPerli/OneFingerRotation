//
//  OneFingerRotationGestureRecognizer.swift
//  OneFinger
//
//  Created by AL on 19/02/2019.
//  Copyright © 2019 AL. All rights reserved.
//

import UIKit

class OneFingerRotationGestureRecognizer: UIGestureRecognizer {
    var rotation:CGFloat!
    
    override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        if let touch = event.touches(for: self),
            touch.count > 1 {
            self.state = .failed
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        if self.state == .possible {
            self.state = .began
        }else{
            self.state = .changed
        }
        
        if let touch = touches.first,
            let myView = self.view {
            
           let center = CGPoint(x: myView.bounds.midX, y: myView.bounds.midY)
            let currentTouchPoint = touch.location(in: myView)
            let previousTouchPoint = touch.previousLocation(in: myView)
            let angleInRadians = atan2(currentTouchPoint.y-center.y, currentTouchPoint.x-center.x)-atan2(previousTouchPoint.y-center.y, previousTouchPoint.x-center.x)
            
            self.rotation = angleInRadians
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        if self.state == .changed {
            self.state = .ended
        }else{
            self.state = .failed
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        self.state = .failed
    }
}
