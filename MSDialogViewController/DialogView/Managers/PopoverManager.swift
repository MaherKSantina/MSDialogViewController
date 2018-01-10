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
 Used to create a Popover View Controller over given View Controller
 */
class PopoverManager: NSObject {
    
    var detailsView: UIView! 
    var backgroundMaskButton: UIButton!
    var animationManager = AnimationManager()
    
    /// Translates details view below its frame and hides background mask
    func viewDidLoad() {
        setupDetailsView()
        setupBackgroundMask()
    }
    
    /// Translates details view into its initial position and fades in background mask
    /// - Parameter completion: Block to be executed after the details are shown
    func viewDidAppear(completion: (() -> Void)?) {
        showBackgroundMask()
        showDetails(completion: completion)
    }
    
    func finish(completion: (() -> Void)?){
        hideDetails(completion: completion)
        hideBackgroundMask()
    }
    
    private func setupDetailsView(){
        detailsView.transform = CGAffineTransform(translationX: 0, y: detailsView.superview!.frame.height)
    }
    
    private func setupBackgroundMask(){
        backgroundMaskButton.alpha = 0
    }
    
    private func showBackgroundMask() {
        backgroundMaskButton.alpha = 0
        UIView.animate(withDuration: 0.5){
            self.backgroundMaskButton.alpha = 1
        }
    }
    
    private func hideBackgroundMask() {
        backgroundMaskButton.alpha = 1
        UIView.animate(withDuration: 0.5){
            self.backgroundMaskButton.alpha = 0
        }
    }
    
    private func showDetails(completion: (() -> Void)?) {
        animationManager.springWithCompletion(duration: 0.5, animations: {
            self.detailsView.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: {
            finished in
            completion?()
        
        })
    }
    
    private func hideDetails(completion: (() -> Void)?) {
        animationManager.springWithCompletion(duration: 0.5, animations: {
            self.detailsView.transform = CGAffineTransform(translationX: 0, y: self.detailsView.superview!.frame.height)
        }, completion: {
            finished in
            completion?()
        })
    }
}
