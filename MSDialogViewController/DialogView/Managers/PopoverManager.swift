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
 Used to manage a view controller that has a popover. This class handles the showing/hiding of the details view
 */
class PopoverManager: NSObject {
    
    //Default animation duration for all animations
    static let kAnimationDuration: TimeInterval = 0.5
    
    ///The main view that will be shown/hidden
    weak var detailsView: UIView!
    ///The background mask that will be shown/hidden behind the details view
    weak var backgroundMaskButton: UIButton!
    ///Handles the animation for the background mask and details view
    var animationManager = AnimationManager()
    
    /// This function translates the details view below the frame of the view controller's view and hides the background mask. This function should be called in the viewDidLoad function of the view controller
    func viewDidLoad() {
        setupDetailsView()
        setupBackgroundMask()
    }
    /**
     Translates details view into its initial position and fades in background mask
     - Parameter completion: Block to be executed after the details view is shown
     */
    func viewDidAppear(completion: (() -> Void)?) {
        showBackgroundMask()
        showDetails(completion: completion)
    }
    /**
     Translates details view into its initial position and fades in background mask
     - Parameter completion: Block to be executed after the details view is shown
     */
    func finish(completion: (() -> Void)?){
        hideDetails(completion: completion)
        hideBackgroundMask()
    }
    /**
     Sets up the details view by translating it below the view controller's view.
     */
    private func setupDetailsView(){
        detailsView.transform = CGAffineTransform(translationX: 0, y: detailsView.superview!.frame.height)
    }
    /**
     Sets up the background mask by making it invisible.
     */
    private func setupBackgroundMask(){
        backgroundMaskButton.alpha = 0
    }
    /**
     Shows the background mask by setting its alpha to 1 within an animation duration.
     - Parameter duration: The duration of the animation
     */
    private func showBackgroundMask(withAnimationDuration duration: TimeInterval = kAnimationDuration) {
        backgroundMaskButton.alpha = 0
        UIView.animate(withDuration: duration){
            self.backgroundMaskButton.alpha = 1
        }
    }
    /**
     Hides the background mask by setting its alpha to 0 within an animation duration.
     - Parameter duration: The duration of the animation
     */
    private func hideBackgroundMask(withAnimationDuration duration: TimeInterval = kAnimationDuration) {
        backgroundMaskButton.alpha = 1
        UIView.animate(withDuration: duration){
            self.backgroundMaskButton.alpha = 0
        }
    }
    /**
     Shows the details view by translating it to its initial position.
     - Parameter duration: The duration of the animation
     - Parameter completion: The completion block that will be executed after the animation ends
     */
    private func showDetails(withAnimationDuration duration: TimeInterval = kAnimationDuration, completion: (() -> Void)?) {
        animationManager.springWithCompletion(duration: duration, animations: {
            self.detailsView.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: {
            finished in
            completion?()
        
        })
    }
    /**
     Hides the details view by translating it outside the view controller's view.
     - Parameter duration: The duration of the animation
     - Parameter completion: The completion block that will be executed after the animation ends
     */
    private func hideDetails(withAnimationDuration duration: TimeInterval = kAnimationDuration, completion: (() -> Void)?) {
        animationManager.springWithCompletion(duration: duration, animations: {
            self.detailsView.transform = CGAffineTransform(translationX: 0, y: self.detailsView.superview!.frame.height)
        }, completion: {
            finished in
            completion?()
        })
    }
}
