//
//  CientProfileViewController.swift
//  iShoddy
//
//  Created by JJLZ on 10/25/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import UIKit

class CientProfileViewController: UIViewController {
    
    // MARK: Outlet's
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    weak var delegate: LeftMenuProtocol?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.removeNavigationBarItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setupViews()
    {
        self.setNavigationBarItem()
        self.title = "Tus datos"
        
        // Close button with image
        let image = UIImage(named: "close")?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(closeViewController))
        
        spinner.stopAnimating()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CientProfileViewController.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    // MARK: Actions
    
    @objc func closeViewController()
    {
        delegate?.showViewController(InvisibleMenu.categories)
    }

    @objc func handleTap() {
        view.endEditing(true)
    }
    
    @IBAction func btnLogoutTapped(_ sender: Any) {
        
        spinner.startAnimating()
        let strAuthToken = AuthService.instance.authToken
        
        AuthService.instance.logoutUser(token: strAuthToken) { (success) in
            
            if success {
                
                UserDataService.instance.logoutClientUser()
                NotificationCenter.default.post(name: constants.NOTIF_USER_DATA_DID_CHANGE, object: nil)
                self.closeViewController()
                
            } else {
                // TODO: 1 error handler
            }
            
            self.spinner.stopAnimating()
        }

    }
}





























































