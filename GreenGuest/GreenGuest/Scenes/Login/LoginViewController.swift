//
//  LoginViewController.swift
//  GreenGuest
//
//  Created by Vidadi Muradzada on 05.09.26.
//

import UIKit
import SnapKit



class LoginViewController: UIViewController {
    
    private let azLan = UIButton()
    private let betweenStick = UILabel()
    private let enLan = UIButton()
    private let lanStack = UIStackView()
    //--------------------------------------------
    private let headerText = UILabel()
    private let subTitle = UILabel()
    private let textStack = UIStackView()
    //--------------------------------------------
    private let mobileTf = BaseTextFields(textFieldStyle: .mobile)
    private let passwordTf = BaseTextFields(textFieldStyle: .password)
    private let tfStack = UIStackView()
    //--------------------------------------------
    private let forgetPassword = UIButton()
    //--------------------------------------------
    private let loginBtn = BaseButtons(buttonStyle: .login)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupLayout()
        setupAction()
    }
    
    
    private func setupUI() {
        azLan.setTitle("AZ", for: .normal)
        azLan.setTitleColor(.gray, for: .normal)
        azLan.titleLabel?.font = UIFont(name:"DMSans-Regular", size: 16)
        
        betweenStick.text = "|"
        betweenStick.textColor = .gray
        betweenStick.font = UIFont(name:"DMSans-Regular",size: 20)
        
        
        enLan.setTitle("EN", for: .normal)
        enLan.setTitleColor(.black, for: .normal)
        enLan.titleLabel?.font = UIFont(name:"DMSans-Regular", size: 16)
        
        
        headerText.text = "Xoş gəlmisiniz!"
        headerText.textColor = .black
        headerText.font = UIFont(name:"DMSans-SemiBold",size:30)
        
        subTitle.text = "Bir-birindən fərqli aqroturizm fəaliyyətləri üçün hesabınıza daxil olun!"
        subTitle.textColor = .neutral600
        subTitle.font = UIFont(name:"DMSans-Regular",size:16)
        subTitle.numberOfLines = 0
        
        
        
        forgetPassword.setTitle("Şifrəni unutdunuz?", for: .normal)
        forgetPassword.setTitleColor(.primary700, for: .normal)
        forgetPassword.titleLabel?.font = UIFont(name: "DMSans-Medium",size:14)
        
    }
    
    private func setupLayout() {
        view.addSubview(lanStack)
        [azLan,betweenStick,enLan].forEach{lanStack.addArrangedSubview($0)}
        lanStack.axis = .horizontal
        lanStack.spacing = 1
        
        lanStack.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(12)
            make.trailing.equalToSuperview().inset(20)
        }
     
        view.addSubview(textStack)
        [headerText,subTitle].forEach{textStack.addArrangedSubview($0)}
        textStack.axis = .vertical
        textStack.spacing = 8
        
        textStack.snp.makeConstraints{ make in
            make.top.equalTo(lanStack.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        
        view.addSubview(tfStack)
        [mobileTf,passwordTf].forEach{tfStack.addArrangedSubview($0)}
        tfStack.axis = .vertical
        tfStack.spacing = 16
        
        tfStack.snp.makeConstraints{ make in
            make.top.equalTo(textStack.snp.bottom).offset(28)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        view.addSubview(forgetPassword)
        forgetPassword.snp.makeConstraints{ make in
            make.top.equalTo(tfStack.snp.bottom).offset(12)
            make.trailing.equalToSuperview().inset(12)
        }
        
        
        view.addSubview(loginBtn)
        loginBtn.snp.makeConstraints{ make in
            make.top.equalTo(forgetPassword.snp.bottom).offset(28)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func setupAction() {
        azLan.addTarget(self, action: #selector(didTapAz), for: .touchUpInside)
        enLan.addTarget(self, action: #selector(didTapEn), for: .touchUpInside)
    }

    
    @objc private func didTapEn() {
        enLan.setTitleColor(.black, for: .normal)
        betweenStick.textColor = .gray
        azLan.setTitleColor(.gray, for: .normal)
    }
    
    @objc private func didTapAz() {
        azLan.setTitleColor(.black, for: .normal)
        betweenStick.textColor = .gray
        enLan.setTitleColor(.gray, for: .normal)
    }
}

