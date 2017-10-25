//
//  LeftViewController.swift
//  iShoddy
//
//  Created by JJLZ on 9/26/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import UIKit

enum LeftMenu: Int {
    case categories = 0
    case registerAsClient
    case login
}

protocol LeftMenuProtocol: class
{
    func changeViewController(_ menu: LeftMenu);
}

class LeftViewController: UIViewController, LeftMenuProtocol {
    
    // MARK: IBOutlet's
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var ivProfile: CircleImage!
    
    var menus = ["Categories", "Registration"]
    var categories: UIViewController!
    var registerAsClient: UIViewController!
    var login: UIViewController!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.tableView.separatorColor = constants.backgroundColor
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let categoriesViewController = storyboard.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        self.categories = UINavigationController(rootViewController: categoriesViewController)
        
        let registerAsClientController = storyboard.instantiateViewController(withIdentifier: "RegisterAsClientViewController") as! RegisterAsClientViewController
        self.registerAsClient = UINavigationController(rootViewController: registerAsClientController)
        registerAsClientController.delegate = self
        
        let loginController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.login = UINavigationController(rootViewController: loginController)
        loginController.delegate = self
        
        self.tableView.registerCellClass(BaseTableViewCell.self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func changeViewController(_ menu: LeftMenu)
    {
        switch menu
        {
        case .categories:
            self.slideMenuController()?.changeMainViewController(self.categories, close: true)
        case .registerAsClient:
            self.slideMenuController()?.changeMainViewController(self.registerAsClient, close: true)
        case .login:
            self.slideMenuController()?.changeMainViewController(self.login, close: true)
        }
    }
    
    // MARK: Actions
    @IBAction func btnLoginTapped(_ sender: Any) {
        self.changeViewController(.login)
    }
}

extension LeftViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if let menu = LeftMenu(rawValue: indexPath.row) {
            switch menu
            {
            case .categories, .registerAsClient, .login:
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
            case .categories, .registerAsClient, .login:
                let cell = BaseTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: BaseTableViewCell.identifier)
                cell.setData(menus[indexPath.row])
                
                return cell
            }
        }
        
        return UITableViewCell()
    }
}































