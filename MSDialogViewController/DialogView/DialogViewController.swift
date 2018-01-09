
import UIKit

class DialogViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    let popoverManager = PopoverManager()
    @IBInspectable var dismissOnBackgroundPress: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let color = UIColor.black.withAlphaComponent(0.5)
        let button = UIButton()
        button.backgroundColor = color
        button |> view
        button.addTarget(self, action: #selector(DialogViewController.backgroundDidPress(_:)), for: .touchUpInside)
        view.sendSubview(toBack: button)
        popoverManager.backgroundMaskButton = button
        popoverManager.detailsView = mainView
        popoverManager.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        popoverManager.viewDidAppear(completion: nil)
    }
    
    @objc
    func backgroundDidPress(_ sender: Any?){
        if dismissOnBackgroundPress {
            close()
        }
    }
    
    func setPopoverView(){
        popoverManager.detailsView = mainView
        popoverManager.viewDidLoad()
    }
    
    func close(){
        popoverManager.finish{
            self.dismiss(animated: false, completion: nil)
        }
    }
    

}
