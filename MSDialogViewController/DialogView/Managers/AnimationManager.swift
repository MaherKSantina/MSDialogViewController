

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
