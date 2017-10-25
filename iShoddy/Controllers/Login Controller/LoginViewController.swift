//
//  LoginViewController.swift
//  iShoddy
//
//  Created by JJLZ on 10/24/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import UIKit

// TODO 3: Meter todo en un scrollview

class LoginViewController: UIViewController {
    
    // MARK: IBOutlet's
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    weak var delegate: LeftMenuProtocol?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
        self.title = "Iniciar sesión"
        
        controlColorsSetup()
        
        txtEmail.delegate = self
        txtPassword.delegate = self
        
        // Close button with image
        let image = UIImage(named: "close")?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(closeViewController))
        
        spinner.isHidden = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.handleTap))
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
    
    @objc func closeViewController()
    {
        delegate?.changeViewController(LeftMenu.categories)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    // MARK: Actions
    
    // TODO 1: Use interactors
    @IBAction func btnLoginTapped(_ sender: Any) {
        
        // TODO: 1 we need validations here
        // https://stackoverflow.com/questions/30913917/focusing-a-text-field-in-swift
        
        guard let email = txtEmail.text, txtEmail.text != "" else {
            return
        }
        
        guard let password = txtPassword.text, txtPassword.text != "" else {
            return
        }
        
        spinner.isHidden = false
        // TODO 3: igual no es necesario:
        spinner.startAnimating()
        
        AuthService.instance.loginUser(email: email, password: password) { (success) in
            
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
        
    @IBAction func btnRegisterTapped(_ sender: Any) {
        
        delegate?.changeViewController(LeftMenu.registerAsClient)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if (textField == self.txtEmail) {
            self.txtPassword.becomeFirstResponder()
        } else if (textField == self.txtPassword) {
            btnLoginTapped(self)
        }
        
        return true
    }
}






























