//
//  MenuViewController.swift
//  titktok_clone_storyboard
//
//  Created by Nguyen Xuan Tien Dung on 12/01/2024.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import RxGesture

class MenuViewController: UITabBarController {

    var tabBarcontroller = tabbar()
    
    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
       setHierachy()
        setupLayout()
        setupProperties()
        bind()
        view.layoutIfNeeded()
       
       
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    func setHierachy() {
        view.addSubview(tabBarcontroller)
    }
    func setupLayout() {
        tabBarcontroller.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview().inset(0)
            $0.height.equalTo(80)
        }
    }
    private func setupProperties() {
        tabBar.isHidden = true
        
        tabBarcontroller.translatesAutoresizingMaskIntoConstraints = false
 
        
        selectedIndex = 0
        let controllers = CustomModel.allCases.map { $0.viewController }
        setViewControllers(controllers, animated: true)
    }

    private func selectTabWith(index: Int) {
        self.selectedIndex = index
    }
    private func bind() {
        tabBarcontroller.itemTapped
            .bind { [weak self] in self?.selectTabWith(index: $0) }
            .disposed(by: disposeBag)
    }
}
final class tabbar: UIStackView {
    var itemTapped: Observable<Int> { itemTappedSubject.asObservable() }
    private lazy var customItemViews: [CustomItem] = [newfeed,FriendsUser,notification,addVideo,profile]
 private let disposeBag = DisposeBag()
    private let itemTappedSubject = PublishSubject<Int>()
    
    private let newfeed = CustomItem(with: .newFeed, index: 0)
    private let FriendsUser = CustomItem(with: .Friends, index: 1)
    private let notification = CustomItem(with: .Addvideo, index: 2)
    private let addVideo = CustomItem(with: .notification, index: 3)
    private let profile = CustomItem(with: .Profile, index: 4)
    
    init(){
        super.init(frame: .zero)
        setHierarchy()
        setupProperties()
        bind()
        setNeedsLayout()
        layoutIfNeeded()
        selectItem(index: 0)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setHierarchy() {
        addArrangedSubviews([newfeed,FriendsUser,notification,addVideo,profile])
    }
    
    private func setupProperties() {
        distribution = .fillEqually
        alignment = .center
        
        backgroundColor = .black
        
        customItemViews.forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.clipsToBounds = true
            
        }
    }
    private func selectItem(index: Int) {
        customItemViews.forEach{
            $0.isSelected = $0.index == index
            
        }
        itemTappedSubject.onNext(index)
    }
    private func bind() {
        newfeed.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.newfeed.animateClick {
                    self.selectItem(index: self.newfeed.index)
                }
            }
            .disposed(by: disposeBag)
        
        FriendsUser.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.FriendsUser.animateClick {
                    self.selectItem(index: self.FriendsUser.index)
                }
            }
            .disposed(by: disposeBag)
        
        addVideo.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.addVideo.animateClick {
                    self.selectItem(index: self.addVideo.index)
                }
            }
            .disposed(by: disposeBag)
        
        notification.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.notification.animateClick {
                    self.selectItem(index: self.notification.index)
                }
            }
            .disposed(by: disposeBag)
        
        
        profile.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                guard let self = self else { return }
                self.profile.animateClick {
                    self.selectItem(index: self.profile.index)
                }
            }
            .disposed(by: disposeBag)
        
       
    }
}
