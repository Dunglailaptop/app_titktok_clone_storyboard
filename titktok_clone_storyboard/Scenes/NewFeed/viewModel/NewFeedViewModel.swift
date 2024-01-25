//
//  NewFeedViewModel.swift
//  titktok_clone_storyboard
//
//  Created by Nguyen Xuan Tien Dung on 21/01/2024.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay

class NewFeedViewModel {
    private (set) weak var view:NewFeedViewController?
    private var router: NewFeedRouter?
    
    public var dataArray: BehaviorRelay<[Int]> = BehaviorRelay(value: [])
    public var dataArrayMessgae: BehaviorRelay<[Int]> = BehaviorRelay(value: [1,1,1,1,1,1])
}
