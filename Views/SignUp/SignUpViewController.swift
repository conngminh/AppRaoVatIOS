//
//  SignUpViewController.swift
//  AppRaoVat
//
//  Created by Lê Công Minh on 10/04/2022.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfConfirmPW: UITextField!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var lbProvision: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        self.changePhaceHolderTextField(yourTextField: tfEmail, text: "Email", ofSizeText: 17.0)
        self.changePhaceHolderTextField(yourTextField: tfPassword, text: "Mật khẩu", ofSizeText: 17.0)
        self.changePhaceHolderTextField(yourTextField: tfConfirmPW, text: "Xác nhận mật khẩu", ofSizeText: 17.0)
        self.changePhaceHolderTextField(yourTextField: tfPhoneNumber, text: "Số điện thoại", ofSizeText: 17.0)
        self.changePhaceHolderTextField(yourTextField: tfName, text: "Họ và tên", ofSizeText: 17.0)
        
        //label provision
        let attrs1 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.darkGray]
        let attrs2 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : self.hexStringToUIColor(hex: "1D6A96")]
        let attrs3 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.darkGray]
        let attributedString1 = NSMutableAttributedString(string:"Bằng việc đăng ký, bạn đã đồng ý với", attributes:attrs1)
        let attributedString2 = NSMutableAttributedString(string:" Điều khoản sử dụng", attributes:attrs2)
        let attributedString3 = NSMutableAttributedString(string:" của Rao Vặt", attributes:attrs3)
        attributedString1.append(attributedString2)
        attributedString1.append(attributedString3)
        self.lbProvision.attributedText = attributedString1
        
        //textfield
        tfPassword.enablePasswordToggle()
        tfConfirmPW.enablePasswordToggle()
    }
    
    @IBAction func switchLoginScreen(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "LoginViewController")
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    func changePhaceHolderTextField(yourTextField textField: UITextField, text: String, ofSizeText ofSize: Double) {
        textField.attributedPlaceholder = NSAttributedString(string: text, attributes: [
            .font: UIFont.systemFont(ofSize: ofSize)
        ])
    }
    
    //Mã màu
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}
