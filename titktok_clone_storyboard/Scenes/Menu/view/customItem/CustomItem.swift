//
//  CustomItem.swift
//  titktok_clone_storyboard
//
//  Created by Nguyen Xuan Tien Dung on 13/01/2024.
//

import UIKit
import SnapKit

final class CustomItem: UIView {
    private let nameLabel = UILabel()
    private let iconImageView = UIImageView()
    private let underLine = UIView()
    private let containerView = UIView()
    
    var index: Int = 0
    
    private let item: CustomModel
    
    var isSelected = false {
        didSet {
            animateItems()
        }
    }
    
    init(with item: CustomModel, index: Int) {
        self.item = item
        self.index = index
        
        super.init(frame: .zero)
        
        self.setupHierarchy()
        self.setupLayout()
        self.setupProperties()
    }
    private func setupHierarchy() {
        addSubview(containerView)
        containerView.addSubviews(nameLabel, iconImageView, underLine)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProperties() {
        nameLabel.configureWith(item.name,
                                color: .white,
                                alignment: .center,
                                size: 11,
                                weight: .semibold)
        underLine.backgroundColor = .white
       
        
        iconImageView.image = isSelected ? item.selectedIcon : item.icon
        
        if(self.index == 1){
            containerView.tag = self.index
            let label: UILabel = UILabel()
            label.frame = CGRectMake(42, 0, 30, 18)
            label.backgroundColor = .red
            label.textAlignment = NSTextAlignment.center
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 9
            label.borderWidth = 2
            label.borderColor = .white
            label.tag = 222222222
            label.configureWith("1",
                                color: .white,
                                        alignment: .center,
                                        size: 10,
                                weight: .bold)
            
            label.isHidden = true
            containerView.addSubview(label)
        }else if(self.index == 2){
                containerView.tag = self.index
                let label: UILabel = UILabel()
                label.frame = CGRectMake(42, 0, 30, 18)
            label.backgroundColor = .red
                label.textAlignment = NSTextAlignment.center
                label.layer.masksToBounds = true
                label.layer.cornerRadius = 9
            label.borderWidth = 2
            label.borderColor = .white
            label.tag = 222222222
                label.configureWith("1",
                                    color: .white,
                                            alignment: .center,
                                            size: 10,
                                    weight: .bold)
            
                label.isHidden = true
                containerView.addSubview(label)
            
        }else if(self.index == 3){
            containerView.tag = self.index
            let label: UILabel = UILabel()
            label.frame = CGRectMake(42, 0, 30, 18)
            label.backgroundColor = .red
            label.textAlignment = NSTextAlignment.center
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 9
            label.borderWidth = 2
            label.borderColor = .white
            label.tag = 222222222
          
            label.configureWith("1",
                                color: .white,
                                        alignment: .center,
                                        size: 10,
                                weight: .bold)
        
            label.isHidden = true
            containerView.addSubview(label)
        
    }
    }
    
    
    private func setupLayout() {
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.center.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints {
            $0.height.width.equalTo(40)
            $0.top.equalToSuperview()
            $0.bottom.equalTo(nameLabel.snp.top)
            $0.centerX.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(16)
        }
        
        underLine.snp.makeConstraints {
            $0.width.equalTo(40)
            $0.height.equalTo(4)
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(nameLabel.snp.centerY)
        }
    }
    
    private func bind() {
        
    }
    private func animateItems() {
        UIView.animate(withDuration: 0.4) { [unowned self] in
            self.nameLabel.alpha = self.isSelected ? 0.0 : 1.0
            self.underLine.alpha = self.isSelected ? 1.0 : 0.0
        }
        UIView.transition(with: iconImageView,
                          duration: 0.4,
                          options: .transitionCrossDissolve) { [unowned self] in
            self.iconImageView.image = self.isSelected ? self.item.selectedIcon : self.item.icon
        }
    }
}
