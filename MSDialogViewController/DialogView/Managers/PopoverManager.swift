
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
