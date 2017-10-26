//
//  LeftViewController.swift
//  iShoddy
//
//  Created by JJLZ on 9/26/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import UIKit

enum LeftMenu: Int {
    case clientProfile = 0
    case demands
    case chats
    case help
    case separator
    case professional
    case registerAsProfessional
}

enum InvisibleMenu: Int {
    case categories = 0
    case registerAsClient
    case loginAsClient
}

protocol LeftMenuProtocol: class
{
    func changeViewController(_ menu: LeftMenu);
    func showViewController(_ menu: InvisibleMenu)
}

class LeftViewController: UIViewController, LeftMenuProtocol {
    
    // MARK: IBOutlet's
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var ivProfile: CircleImage!
    @IBOutlet weak var lblDemands: UILabel!
    
    var menus = ["    Mi perfil","    Demandas", "    Chats", "    Ayuda", "", "PROFESIONAL", "    Alta como profesional"]
    var categories: UIViewController!
    var registerAsClient: UIViewController!
    var loginAsClient: UIViewController!
    var clientProfile: UIViewController!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let categoriesViewController = storyboard.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        self.categories = UINavigationController(rootViewController: categoriesViewController)
        
        let registerAsClientController = storyboard.instantiateViewController(withIdentifier: "RegisterAsClientViewController") as! RegisterAsClientViewController
        self.registerAsClient = UINavigationController(rootViewController: registerAsClientController)
        registerAsClientController.delegate = self
        
        let loginController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.loginAsClient = UINavigationController(rootViewController: loginController)
        loginController.delegate = self
        
        let clientProfileController = storyboard.instantiateViewController(withIdentifier: "CientProfileViewController") as! CientProfileViewController
        self.clientProfile = UINavigationController(rootViewController: clientProfileController)
        clientProfileController.delegate = self
        
        self.tableView.separatorColor = constants.separatorColor
        self.tableView.registerCellClass(BaseTableViewCell.self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(LeftViewController.userDataDidChange(_:)), name: constants.NOTIF_USER_DATA_DID_CHANGE, object: nil)
        setupUserInfo()
    }
    
    @objc func userDataDidChange(_ notif: Notification)
    {
        setupUserInfo()
    }
    
    func setupUserInfo()
    {
        if AuthService.instance.isLoogedIn {
            btnLogin.setTitle(UserDataService.instance.email, for: .normal)
            btnLogin.isEnabled = false
            ivProfile.image = UIImage(named: "userLoggedIn")
            lblDemands.text = "1 Demanda solicitada"
        } else {
            btnLogin.setTitle("Inicia sesión", for: .normal)
            btnLogin.isEnabled = true
            ivProfile.image = UIImage(named: "profileDefault")
            lblDemands.text = ""
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func showViewController(_ menu: InvisibleMenu)
    {
        switch menu
        {
        case .categories:
            self.slideMenuController()?.changeMainViewController(self.categories, close: true)
        case .registerAsClient:
            self.slideMenuController()?.changeMainViewController(self.registerAsClient, close: true)
        case .loginAsClient:
            self.slideMenuController()?.changeMainViewController(self.loginAsClient, close: true)
        }
    }
    
    func changeViewController(_ menu: LeftMenu)
    {
        switch menu
        {
        case .clientProfile:
            
            if AuthService.instance.isLoogedIn {
                self.slideMenuController()?.changeMainViewController(self.clientProfile, close: true)
            } else {
                self.slideMenuController()?.changeMainViewController(self.loginAsClient, close: true)
            }
            
        case .demands:
            print("Demandas cell tapped")
        case .chats:
            print("Chats cell tapped")
        case .help:
            print("Ayuda cell tapped")
        case .separator:
            print("Separator cell tapped")
        case .professional:
            //--
            UserDataService.instance.logoutClientUser()
            setupUserInfo()
            print("Profesional cell tapped")
            //--
        case .registerAsProfessional:
            print("Alta como profesional cell tapped")
        }
    }
    
    // MARK: Actions
    @IBAction func btnLoginTapped(_ sender: Any) {
        self.showViewController(.loginAsClient)
    }
}

extension LeftViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if let menu = LeftMenu(rawValue: indexPath.row) {
            switch menu
            {
            case .clientProfile, .demands, .chats, .help, .separator, .professional, .registerAsProfessional:
                return BaseTableViewCell.height()
            }
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menu = LeftMenu(rawValue: indexPath.row)
        {
            self.changeViewController(menu)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.tableView == scrollView {
            
        }
    }
}

extension LeftViewController: UITableViewDataSource
{    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let menu = LeftMenu(rawValue: indexPath.row) {
            switch menu
            {
            case .clientProfile, .demands, .chats, .help, .separator, .professional, .registerAsProfessional:
                let cell = BaseTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: BaseTableViewCell.identifier)
                cell.setData(menus[indexPath.row])
                
                return cell
            }
        }
        
        return UITableViewCell()
    }
}






























