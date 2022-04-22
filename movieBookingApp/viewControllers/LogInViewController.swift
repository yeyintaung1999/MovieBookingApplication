import UIKit

class LogInViewController: UIViewController {
    
    let networkAgent = NetworkAgent.shared
    
    var logindata : LoginDataClass?
    
    @IBOutlet weak var googlebutton: UIButton!
    @IBOutlet weak var phoneTf: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
    
    
    @IBOutlet weak var viewfacebook: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var signinView: UIView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginoverlay: UIView!
    @IBOutlet weak var signinLabel: UILabel!
    @IBOutlet weak var signinoverlay: UIView!
    @IBOutlet weak var facebookSignin: UIView!
    @IBOutlet weak var googleSignin: UIView!
    
    @IBOutlet weak var facebookbutton: UIButton!
    @IBOutlet weak var loginsignincollectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        facebookSignin.layer.borderColor = UIColor.lightGray.cgColor
        facebookSignin.layer.borderWidth = 1
        facebookSignin.layer.cornerRadius = 5
        
        googleSignin.layer.borderColor = UIColor.lightGray.cgColor
        googleSignin.layer.borderWidth = 1
        googleSignin.layer.cornerRadius = 5
        
        italicPlaceholder(placeholdertf: phoneTf, text: "Enter Your Phone Number")
        italicPlaceholder(placeholdertf: nameTF, text: "Enter Your Name")
        italicPlaceholder(placeholdertf: passwordTF, text: "Enter Password")
        italicPlaceholder(placeholdertf: emailTF, text: "Enter Your Email")
        
        underlinedTF(textFieldName: phoneTf)
        underlinedTF(textFieldName: nameTF)
        underlinedTF(textFieldName: passwordTF)
        underlinedTF(textFieldName: emailTF)
        
        tapGestForLogin()
        tapGestForSignin()
        
        nameView.isHidden=true
        phoneView.isHidden=true
        
    }
    
    func FetchEmailLoginData(){
        
        let emailText = emailTF.text
        let passwordText = passwordTF.text
        
        networkAgent.loginWithEmail(email: emailText!, password: passwordText!) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let data):
                self.logindata = data.data
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: MainScreenViewController.self)) as! MainScreenViewController
                vc.profiledata = data.data
                vc.modalTransitionStyle = .coverVertical
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            case .failure(let message): print(message)
            }
        }
        
    }
    
    func FetchEmailRegisterData(){
        let nameText = nameTF.text
        let emailText = emailTF.text
        let phoneText = phoneTf.text
        let passwordText = passwordTF.text
        networkAgent.registerWithEmail(name: nameText!, email: emailText!, phone: phoneText!, password: passwordText!, google: "1212", facebook: "78987") { [weak self] (result) in
            
            guard let self = self else {return}
            switch result {
            case .success(let data):
                self.logindata = data.data
                print("\(data.message ?? "undefined")")
                self.tapLogin()
            case .failure(let message): print(message)
            }
        }
    }
    
    func italicPlaceholder(placeholdertf:UITextField, text: String){
        placeholdertf.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.font:UIFont.italicSystemFont(ofSize: 18)])
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        FetchEmailLoginData()
  
    }
    
    func tapGestForLogin(){
        let tapGestRecognizerLogin = UITapGestureRecognizer(target: self, action: #selector(tapLogin))
        loginView.isUserInteractionEnabled=true
        loginView.addGestureRecognizer(tapGestRecognizerLogin)
        
    }
    
    func tapGestForSignin(){
        let tapGestRecognizerSignin = UITapGestureRecognizer(target: self, action: #selector(tapSignin))
        signinView.isUserInteractionEnabled=true
        signinView.addGestureRecognizer(tapGestRecognizerSignin)
    }
    
    @objc func tapLogin(){
        nameView.isHidden=true
        phoneView.isHidden=true
        loginLabel.textColor=UIColor(named: "primaryColor")
        loginoverlay.backgroundColor=UIColor(named: "primaryColor")
        signinLabel.textColor=UIColor.black
        signinoverlay.backgroundColor=UIColor.white
    }
    
    @objc func tapSignin(){
        nameView.isHidden=false
        phoneView.isHidden=false
        loginoverlay.backgroundColor=UIColor.white
        loginLabel.textColor=UIColor.black
        signinLabel.textColor=UIColor(named: "primaryColor")
        signinoverlay.backgroundColor=UIColor(named: "primaryColor")
    }
    
}
