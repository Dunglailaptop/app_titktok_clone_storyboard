//
//  DialogshowMessageViewController.swift
//  titktok_clone_storyboard
//
//  Created by Nguyen Xuan Tien Dung on 21/01/2024.
//

import UIKit

class DialogshowMessageViewController: UIViewController {

    @IBOutlet weak var root_view: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOutSide(_:)))
            tapGesture.cancelsTouchesInView = false
            UIApplication.shared.windows.first?.addGestureRecognizer(tapGesture) // Attach to the window
        // Do any additional setup after loading the view.
    }


    @objc func handleTapOutSide(_ gesture: UITapGestureRecognizer) {
        let tapLocation = gesture.location(in: self.root_view)
        if !root_view.bounds.contains(tapLocation) {
                // Handle touch outside of the view
                dismiss(animated: true, completion: nil)
            }
        }

}
