//
//  LoginViewController.swift
//  AppRaoVat
//
//  Created by Lê Công Minh on 09/04/2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        self.changePhaceHolderTextField(yourTextField: tfEmail, text: "Nhập email của bạn", ofSizeText: 17.0)
        self.changePhaceHolderTextField(yourTextField: tfPassword, text: "Nhập mật khẩu của bạn", ofSizeText: 17.0)
        tfPassword.enablePasswordToggle()
    }
    
    func changePhaceHolderTextField(yourTextField textField: UITextField, text: String, ofSizeText ofSize: Double) {
        textField.attributedPlaceholder = NSAttributedString(string: text, attributes: [
            .font: UIFont.systemFont(ofSize: ofSize)
        ])
    }
    
    @IBAction func SwitchSignUpScreen(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func switchHomeScreen(_ sender: Any) {
        let alert = UIAlertController(title: "Chúc mừng bạn đã đăng nhập thành công", message: nil, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .default) { action in
            print("Lê Công Minh")
        }
        alert.addAction(actionOk)
        present(alert, animated: true, completion: nil)
    }
}

extension UITextField {
    
    fileprivate func setPasswordToggleImage(_ button: UIButton) {
        if(isSecureTextEntry){
            button.setImage(UIImage(named: "hidden"), for: .normal)
        }else{
            button.setImage(UIImage(named: "eye"), for: .normal)

        }
    }
    
    func enablePasswordToggle(){
        let button = UIButton(type: .custom)
        setPasswordToggleImage(button)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
//        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
    }
        
    @IBAction func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setPasswordToggleImage(sender as! UIButton)
    }
}
