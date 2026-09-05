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
    //----------------------------------
    private let 
    
    
    
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
        
        
    }
    
    private func setupAction() {
        azLan.addTarget(self, action: #selector(didTapAz), for: .touchUpInside)
        enLan.addTarget(self, action: #selector(didTapEn), for: .touchUpInside)
    }
    
    @objc private func didTapAz() {
        azLan.setTitleColor(.black, for: .normal)
        betweenStick.textColor = .gray
        enLan.setTitleColor(.gray, for: .normal)
    }
    
    @objc private func didTapEn() {
        enLan.setTitleColor(.black, for: .normal)
        betweenStick.textColor = .gray
        azLan.setTitleColor(.gray, for: .normal)
    }
}
