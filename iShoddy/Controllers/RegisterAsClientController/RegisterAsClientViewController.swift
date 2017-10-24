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
    @IBOutlet weak var txtMail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.removeNavigationBarItem()
        txtMail.becomeFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    func setupViews()
    {
        self.setNavigationBarItem()
        self.title = "Registro"
        
        controlColorsSetup()
        
        txtMail.delegate = self
        txtPassword.delegate = self
        
        // TODO: 3 button with image
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(closeViewController))
        
        spinner.isHidden = true
    }
    
    func controlColorsSetup()
    {
        txtMail.applyPrimaryColorBorder()
        txtPassword.applyPrimaryColorBorder()
        
        btnRegister.layer.cornerRadius = 5
        btnRegister.layer.masksToBounds = true
        
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
    
    @IBAction func btnRegisterTapped(_ sender: Any) {
        
        // TODO: 1 we need validations here
        // https://stackoverflow.com/questions/30913917/focusing-a-text-field-in-swift
        
        guard let email = txtMail.text, txtMail.text != "" else {
            return
        }
        
        guard let password = txtPassword.text, txtPassword.text != "" else {
            return
        }
        
        spinner.isHidden = false
        spinner.startAnimating()
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            
            if success {
                self.closeViewController()
                // TODO: 1 notification user logged
            } else {
                // TODO: 1 error handler
            }
            
            self.spinner.isHidden = true
            self.spinner.stopAnimating()
        }
    }
    
    @objc func closeViewController()
    {
        delegate?.changeViewController(LeftMenu.categories)
    }
}

extension RegisterAsClientViewController: UITextFieldDelegate {
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if (textField == self.txtMail) {
            self.txtPassword.becomeFirstResponder()
        } else if (textField == self.txtPassword) {
            btnRegisterTapped(self)
        }
        
        return true
    }
}





























