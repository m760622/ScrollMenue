//
//  HeaderCollectionReusableView.swift
//  CEScrollMenue
//
//  Created by Mr.LuDashi on 2017/3/27.
//  Copyright © 2017年 ZeluLi. All rights reserved.
//

import UIKit
typealias TapEditButtonClosure = (Bool) -> Void
class CEHeaderCollectionReusableView: UICollectionReusableView {
    
    var titleLabel: UILabel!
    var editButton: CEThemeEditButton!
    var editButtonClosure: TapEditButtonClosure!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.addTitleLabel()
        self.addEditButton()
    }
    
    func setTapEditButtonClosure(editButtonClosure: @escaping TapEditButtonClosure) {
        self.editButtonClosure = editButtonClosure
    }
    
    func setHiddenEditeButton(isHidden: Bool) {
        self.editButton.isHidden = isHidden
    }
    
    func addTitleLabel() {
        self.titleLabel = UILabel(frame: CGRect(x: 15, y: 30, width: 200, height: 20))
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        self.addSubview(titleLabel)
    }
    
    func addEditButton() {
        self.editButton = CEThemeEditButton(frame: CGRect(x: self.frame.width - 55, y: 30, width: 40, height: 25))
        self.editButton.addTarget(self, action: #selector(tapEditButton(sender:)), for: .touchUpInside)
        self.addSubview(self.editButton)
    }
    
    func tapEditButton(sender: CEThemeEditButton) {
        editButton.isSelected = !editButton.isSelected
        print(editButton.isSelected)
        if editButtonClosure != nil {
            self.editButtonClosure(editButton.isSelected)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}