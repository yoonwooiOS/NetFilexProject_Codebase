//
//  SignUpViewController.swift
//  NetFilexProject_Codebase
//
//  Created by 김윤우 on 6/4/24.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {

    let titleLabel = UILabel() 
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let nicknameTextField = UITextField()
    let locationTextField = UITextField()
    let referralCodeTextField = UITextField()
    let signUpButton = UIButton()
    let addInformationButton = UIButton()
    let switchToggleButton = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    
    func configureHierarchy() {
        
        view.addSubview(titleLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(nicknameTextField)
        view.addSubview(locationTextField)
        view.addSubview(referralCodeTextField)
        view.addSubview(signUpButton)
        view.addSubview(addInformationButton)
        view.addSubview(switchToggleButton)
        
    }
    
    
    func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(100)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-50)
            make.height.equalTo(30)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(24)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-50)
            make.height.equalTo(30)
        }
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(24)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-50)
            make.height.equalTo(30)
        }
        locationTextField.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom).offset(24)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-50)
            make.height.equalTo(30)
        }
        referralCodeTextField.snp.makeConstraints { make in
            make.top.equalTo(locationTextField.snp.bottom).offset(24)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-50)
            make.height.equalTo(30)
        }
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(referralCodeTextField.snp.bottom).offset(24)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-50)
        }
        addInformationButton.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(24)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.width.equalTo(120)
        }
        
        switchToggleButton.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-50)
        }
        
        
    }
    
    func configureUI() {
        
        view.backgroundColor = .black
        titleLabel.primaryTitleLabel(labelText: "YUNFLIX", textAlignment: .center, fontSize: 34, textColor: .systemRed)
        
        emailTextField.primaryTextfield(placeholderText: "이메일 주소 또는 전화번호", textAlignment: .center)
        passwordTextField.primaryTextfield(placeholderText: "비밀번호", textAlignment: .center)
        nicknameTextField.primaryTextfield(placeholderText: "닉네임", textAlignment: .center)
        locationTextField.primaryTextfield(placeholderText: "위치", textAlignment: .center)
        referralCodeTextField.primaryTextfield(placeholderText: "추천 코드", textAlignment: .center)
        
        signUpButton.primaryButton(buttonTitle: "회원가입", titleColor: .black, fontSize: 14, backgroundColor: .systemGray5, cornerRadius: 5, assetImageName: "")
        
        addInformationButton.primaryButton(buttonTitle: "추가 정보 입력하기", titleColor: .white, fontSize: 14, backgroundColor: .clear, cornerRadius: 0, assetImageName: "")
        
        switchToggleButton.onTintColor = .red
    }
    
    
    
}
