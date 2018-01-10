/**
 MIT License
 
 Copyright (c) 2018 MaherKSantina
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

import UIKit

/**
 
 Responsible for creating animations among objects (Taken from mengTo: https://twitter.com/mengto)
 
 */
class AnimationManager: NSObject {
    /**
     Animates animations with a specific duration
     - Parameters:
        - duration: The duration of the animation
        - animations: The animations needed
     - Remark:
        - Delay is 0
        - Spring Damping is 0.7
        - Initial Spring Velocity is 0.7
        - Options is Curve Linear
        - Does nothing on Completion
     
     */
    func spring(duration: TimeInterval, animations: (() -> Void)!) {
        
        UIView.animate(withDuration:
            duration,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.7,
                       options: .curveLinear,
                       animations: {
                        
                        animations()
                        
        }, completion: { finished in
        })
    }
    
    /**
     Animates animations after delay with a specific duration
     - Parameters:
        - duration: The duration of the animation
        - delay: The delay before the animation starts
        - animations: The animations needed
     - Remark:
        - Spring Damping is 0.7
        - Initial Spring Velocity is 0.7
        - Options is Curve Linear
        - Does nothing on Completion
     
     */
    func springWithDelay(duration: TimeInterval, delay: TimeInterval, animations: (() -> Void)!) {
        UIView.animate(
            withDuration: duration,
            delay: delay,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.7,
            options: .curveLinear,
            animations: {
                
                animations()
                
        }, completion: { finished in
        })
    }
    
    /**
     Animates animations with a specific duration and executes a block after it finishes
     - Parameters:
        - duration: The duration of the animation
        - animations: The animations needed
        - completion: The completion block to be executed after the animation is finished
     - Remark:
        - Delay is 0
        - Spring Damping is 0.7
        - Initial Spring Velocity is 0.7
        - Options is Curve Linear
     
     */
    func springWithCompletion(duration: TimeInterval, animations: (() -> Void)!, completion: ((Bool) -> Void)!) {
        
        UIView.animate(
            withDuration: duration,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.7,
            options: .curveLinear,
            animations: {
                
                animations()
                
        }, completion: { finished in
            completion(true)
        })
    }
}
