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

class DialogViewController: UIViewController {

    ///The main view that will be shown/hidden
    @IBOutlet weak var mainView: UIView!
    
    ///The manager that will handle hiding/showing the main view and background mask
    let popoverManager = PopoverManager()
    
    ///Boolean that specifies whether tapping on the background mask will dismiss the popover or not
    @IBInspectable var dismissOnBackgroundPress: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackgroundMask()
        popoverManager.detailsView = mainView
        popoverManager.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        popoverManager.viewDidAppear(completion: nil)
    }
    /**
     Adds the background mask, sends it to the back and sets it to the popover background mask.
     */
    private func addBackgroundMask() {
        let color = UIColor.black.withAlphaComponent(0.5)
        let button = UIButton()
        button.backgroundColor = color
        button |> view
        button.addTarget(self, action: #selector(DialogViewController.backgroundDidPress(_:)), for: .touchUpInside)
        view.sendSubview(toBack: button)
        popoverManager.backgroundMaskButton = button
    }
    
    
    @objc
    private func backgroundDidPress(_ sender: Any?){
        if dismissOnBackgroundPress {
            close()
        }
    }
    
    /**
     Finishes the presentation
     */
    @IBAction func close(){
        popoverManager.finish{
            self.dismiss(animated: false, completion: nil)
        }
    }
    

}
