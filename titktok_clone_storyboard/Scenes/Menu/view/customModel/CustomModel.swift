//
//  CustomModel.swift
//  titktok_clone_storyboard
//
//  Created by Nguyen Xuan Tien Dung on 13/01/2024.
//

import UIKit

enum CustomModel: String, CaseIterable {
    case newFeed
    case Friends
    case Addvideo
    case notification
    case Profile
}
 
extension CustomModel {
    var viewController: UIViewController {
        switch self {
        case .newFeed:
            let view = NewFeedViewController(nibName: "NewFeedViewController", bundle: Bundle.main)
            return view
            
        case .Friends:
            let view = FriendsViewController(nibName: "FriendsViewController", bundle: Bundle.main)
            return view
            
        case .Addvideo:
            let view = AddVideoViewController(nibName: "AddVideoViewController", bundle: Bundle.main)
            return view
            
        case .notification:
            let view = NotificationViewController(nibName: "NotificationViewController", bundle: Bundle.main)
            return view
            
        case .Profile:
            let view = ProfileViewController(nibName: "ProfileViewController", bundle: Bundle.main)
            return view
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .newFeed:
            return UIImage(named: "Home")?.withTintColor(.white, renderingMode: .alwaysOriginal)
            
        case .Friends:
            return UIImage(named: "discover")?.withTintColor(.white, renderingMode: .alwaysOriginal)
            
        case .Addvideo:
            return UIImage(named: "plus-video")
            
        case .notification:
            return UIImage(named: "inbox")?.withTintColor(.white, renderingMode: .alwaysOriginal)
            
        case .Profile:
            return UIImage(named: "profile")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        }
    }
    
    var selectedIcon: UIImage? {
        switch self {
        case .newFeed:
            return UIImage(named: "Home")
            
        case .Friends:
            return UIImage(named: "discover")
            
        case .Addvideo:
            return UIImage(named: "plus-video")
       
        case .notification:
            return UIImage(named: "inbox")
            
        case .Profile:
            return UIImage(named: "profile")
        }
    }
    
    var name: String {
        if(self.rawValue.capitalized == "newFeed"){
            return "NewFeed"
        }else if(self.rawValue.capitalized == "Friends"){
            return "Friends"
        }else if(self.rawValue.capitalized == "Friends"){
            return "Friends"
        }else if(self.rawValue.capitalized == "notification"){
            return "notification"
        }else if(self.rawValue.capitalized == "Profile"){
            return "Profile"
        }
        return self.rawValue.capitalized
    }
}
