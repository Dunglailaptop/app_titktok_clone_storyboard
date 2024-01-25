//
//  NewFeedViewController.swift
//  titktok_clone_storyboard
//
//  Created by Nguyen Xuan Tien Dung on 12/01/2024.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay
import ObjectMapper
import VerticalCardSwiper

class NewFeedViewController: UIViewController {

    
    @IBOutlet weak var viewcard: VerticalCardSwiper!
    
    var viewModel = NewFeedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.dataArray.accept([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16])
       register()
        viewcard.datasource = self
       
        // Do any additional setup after loading the view.
    }



}
extension NewFeedViewController: VerticalCardSwiperDatasource {
    func register() {
        let cellNib = UINib(nibName: "CollectionViewCell", bundle: nil)

        viewcard.register(nib: cellNib, forCellWithReuseIdentifier: "CollectionViewCell")
        viewcard.topInset = 0
        viewcard.sideInset = 0
        viewcard.cardSpacing = 0
        
        viewcard.isSideSwipingEnabled = false
     
    }
    func cardForItemAt(verticalCardSwiperView: VerticalCardSwiperView, cardForItemAt index: Int) -> CardCell {
        if let cardCell = verticalCardSwiperView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: index) as? CollectionViewCell {
            // Configure your cell here if needed
            cardCell.btn_showmessage.rx.tap.asDriver().drive(onNext: {
                [weak self] in
                self?.DialogShowMessageViewController()
                
            })
            
            return cardCell
        }
        return CardCell()
    }

 
 func numberOfCards(verticalCardSwiperView: VerticalCardSwiperView) -> Int {
     return viewModel.dataArray.value.count
 }
}
extension NewFeedViewController {
    func DialogShowMessageViewController() {
       
            let dialogConfirm = DialogshowMessageViewController()
            dialogConfirm.view.backgroundColor = ColorUtils.blackTransparent()
        dialogConfirm.viewModel = viewModel.self
     
        
            let nav = UINavigationController(rootViewController: dialogConfirm)
            // 1
             nav.modalPresentationStyle = .overCurrentContext

            // 2
            if #available(iOS 15.0, *) {
                 if let sheet = nav.sheetPresentationController {

                     // 3
                     sheet.detents = [.large()]

                 }
            } else {
             // Fallback on earlier versions
            }
            // 4
            present(nav, animated: true, completion: nil)
         
    }
}
