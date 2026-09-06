//
//  BaseButtons.swift
//  GreenGuest
//
//  Created by Vidadi Muradzada on 05.09.26.
//

import UIKit
import SnapKit

class BaseButtons: UIButton {
    var buttonStyle: CaseButtons
    
    init(buttonStyle: CaseButtons) {
        self.buttonStyle = buttonStyle
        super.init(frame: .zero)
        buttonDesign()
        btnDesign()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonDesign() {
        switch buttonStyle {
        case .login:
            loginBtn()
        }
    }
    
    func loginBtn() {
        self.backgroundColor = .primary700
        self.setTitle("Daxil olun", for: .normal)
        self.setTitleColor(.white,for: .normal)
        self.titleLabel?.font = UIFont(name:"DMSans-Medium",size:16)
    }
    
    func btnDesign() {
        self.layer.cornerRadius = 29
        
        self.snp.makeConstraints{ make in
            make.height.equalTo(58)
        }
    }
    
}
