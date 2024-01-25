//
//  DialogshowMessageViewController.swift
//  titktok_clone_storyboard
//
//  Created by Nguyen Xuan Tien Dung on 21/01/2024.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay

class DialogshowMessageViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var root_view: UIView!
    var viewModel = NewFeedViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOutSide(_:)))
            tapGesture.cancelsTouchesInView = false
            UIApplication.shared.windows.first?.addGestureRecognizer(tapGesture) // Attach to the window
        resgiter()
        bindingtable()
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
extension DialogshowMessageViewController {
    func resgiter() {
        let celltable = UINib(nibName: "ItemMessageTableViewCell", bundle: .main)
        tableview.register(celltable, forCellReuseIdentifier: "ItemMessageTableViewCell")
        tableview.separatorStyle = .none
    }
    func bindingtable() {
        viewModel.dataArrayMessgae.bind(to: tableview.rx.items(cellIdentifier: "ItemMessageTableViewCell", cellType: ItemMessageTableViewCell.self)) {
            (row,cell,data) in
            
        }
    }
}
