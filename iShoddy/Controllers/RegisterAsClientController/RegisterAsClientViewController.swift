//
//  RegisterAsClientViewController.swift
//  iShoddy
//
//  Created by JJLZ on 9/27/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import UIKit

class RegisterAsClientViewController: UIViewController {
    
    weak var delegate: LeftMenuProtocol?
    
    // MARK: IBOutlet's
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        txtEmail.text = ""
        txtPassword.text = ""
        
        self.removeNavigationBarItem()
        txtEmail.becomeFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    func setupViews()
    {
        self.setNavigationBarItem()
        self.title = "¡Regístrate ahora!"
        
        controlColorsSetup()
        
        txtEmail.delegate = self
        txtPassword.delegate = self
        
        // Close button with image
        let image = UIImage(named: "close")?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(closeViewController))

        
        spinner.isHidden = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(RegisterAsClientViewController.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    func controlColorsSetup()
    {
        txtEmail.applyPrimaryColorBorder()
        txtPassword.applyPrimaryColorBorder()
        
        // TODO: 3 change status bar color to primary app color
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: nil, completion: { (context: UIViewControllerTransitionCoordinatorContext!) -> Void in
            guard let vc = (self.slideMenuController()?.mainViewController as? UINavigationController)?.topViewController else {
                return
            }
            if vc.isKind(of: RegisterAsClientViewController.self)  {
                self.slideMenuController()?.removeLeftGestures()
                self.slideMenuController()?.removeRightGestures()
            }
        })
    }
    
    // MARK: Actions
    
    // TODO 1: Use interactors
    @IBAction func btnRegisterTapped(_ sender: Any) {
        
        // TODO: 1 we need validations here
        // https://stackoverflow.com/questions/30913917/focusing-a-text-field-in-swift
        
        guard let email = txtEmail.text, txtEmail.text != "" else {
            return
        }
        
        guard let password = txtPassword.text, txtPassword.text != "" else {
            return
        }
        
        spinner.startAnimating()
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            
            if success {
                self.closeViewController()
                
                NotificationCenter.default.post(name: constants.NOTIF_USER_DATA_DID_CHANGE, object: nil)
            } else {

                // TODO: 1 mejorar error handler
                DispatchQueue.main.async
                {
                    self.showAlertWith(title: "Error", message: "Email y/o contraseña no válidos. Por favor verifique e intente de nuevo.", style: .alert)
                }
            }
        
            self.spinner.stopAnimating()
        }
    }
    
    @objc func closeViewController()
    {
        delegate?.showViewController(InvisibleMenu.categories)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    // TODO 2: mover a ubicacion global
    func showAlertWith(title: String, message: String, style: UIAlertControllerStyle = .alert)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(action)
        
        self.present(alertController, animated: true, completion: nil)
    }
    //--

}

extension RegisterAsClientViewController: UITextFieldDelegate {
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if (textField == self.txtEmail) {
            self.txtPassword.becomeFirstResponder()
        } else if (textField == self.txtPassword) {
            btnRegisterTapped(self)
        }
        
        return true
    }
}





























