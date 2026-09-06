//
//  BaseTextFields.swift
//  GreenGuest
//
//  Created by Vidadi Muradzada on 05.09.26.
//

import UIKit
import SnapKit

class BaseTextFields: UIView {
    var textFieldStyle: CaseTextFields
    var textFieldLbl = UILabel()
    let verticalStack = UIStackView()
    let horizontalStack = UIStackView()
    var inputTf = UITextField()
    let eyeBtn = UIButton()
    
    init(textFieldStyle: CaseTextFields) {
        self.textFieldStyle = textFieldStyle
        super.init(frame: .zero)
        textFieldOptions()
        designView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func textFieldOptions() {
        switch textFieldStyle {
        case .mobile:
            mobileTf()
        case .password:
            passwordTf()
        }
    }
    
    
    func mobileTf() {
        let numberCode = UILabel()
        numberCode.text = "+994"
        numberCode.font = UIFont(name:"DMSans-Regular",size:16)
        numberCode.textColor = .black
        textFieldLbl.text = "Mobil nömrəniz"
        inputTf.keyboardType = .numberPad
        inputTf.placeholder = "XX XXX XX XX"
        //self.addSubview(horizontalStack)
        
        
        [numberCode,inputTf].forEach{horizontalStack.addArrangedSubview($0)}
        horizontalStack.axis = .horizontal
    }
    
    func passwordTf() {
        eyeBtn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        eyeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        eyeBtn.tintColor = .black
        textFieldLbl.text = "Şifrəniz"
        inputTf.placeholder = "example1234"
        inputTf.isSecureTextEntry = true
        horizontalStack.addArrangedSubview(inputTf)
        horizontalStack.axis = .horizontal
        self.addSubview(eyeBtn)
        eyeBtn.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
        eyeBtn.addTarget(self, action: #selector(didTapEye), for: .touchUpInside)
    }
    
    @objc private func didTapEye() {
        inputTf.isSecureTextEntry.toggle()
        
        if inputTf.isSecureTextEntry {
            eyeBtn.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            eyeBtn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
    
    func designView() {
        self.backgroundColor = .neutral50
        self.layer.borderColor = UIColor.neutral100.cgColor
        self.layer.cornerRadius = 29
        
        textFieldLbl.textColor = .neutral500
        textFieldLbl.font = UIFont(name:"DMSans-Regular",size:12)
        self.addSubview(verticalStack)
        [textFieldLbl,horizontalStack].forEach{verticalStack.addArrangedSubview($0)}
        verticalStack.axis = .vertical
        verticalStack.spacing = 2
        
        verticalStack.snp.makeConstraints{ make in
            make.top.bottom.trailing.equalToSuperview().inset(8)
            make.leading.equalToSuperview().offset(16)
        }
        
        self.snp.makeConstraints{ make in
            make.height.equalTo(58)
        }
    }
}

