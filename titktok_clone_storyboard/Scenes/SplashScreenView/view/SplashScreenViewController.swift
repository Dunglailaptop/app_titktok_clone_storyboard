//
//  SplashScreenViewController.swift
//  titktok_clone_storyboard
//
//  Created by Nguyen Xuan Tien Dung on 08/01/2024.
//

import UIKit

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationtoLoginViewController()
    }
 
    
    func navigationtoLoginViewController() {
       let MenuViewControllerss = MenuViewController()
        self.navigationController?.pushViewController(MenuViewControllerss, animated: true)
    }
    func navigationtoMenuViewController() {
        
    }


}
