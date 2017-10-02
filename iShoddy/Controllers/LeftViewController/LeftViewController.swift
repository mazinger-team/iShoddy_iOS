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
}

protocol LeftMenuProtocol: class
{
    func changeViewController(_ menu: LeftMenu);
}

class LeftViewController: UIViewController, LeftMenuProtocol {
    
    // MARK: IBOutlet's
    // #warning: poner esto como
    @IBOutlet weak var tableView: UITableView!
    
    var menus = ["Categories", "Registration"]
    var categories: UIViewController!
    var registerAsClient: UIViewController!
    var imageHeaderView: ImageHeaderView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.tableView.separatorColor = constants.appPrimaryColor
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let categoriesViewController = storyboard.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        self.categories = UINavigationController(rootViewController: categoriesViewController)
        
        let registerAsClientController = storyboard.instantiateViewController(withIdentifier: "RegisterAsClientViewController") as! RegisterAsClientViewController
        self.registerAsClient = UINavigationController(rootViewController: registerAsClientController)
        registerAsClientController.delegate = self
        
        self.tableView.registerCellClass(BaseTableViewCell.self)
        
        self.imageHeaderView = ImageHeaderView.loadNib()
        self.view.addSubview(self.imageHeaderView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.imageHeaderView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 160)
        self.view.layoutIfNeeded()
    }
    
    func changeViewController(_ menu: LeftMenu)
    {
        switch menu
        {
        case .categories:
            //--newcode now --
            print("ir a categories")
            //--
            self.slideMenuController()?.changeMainViewController(self.categories, close: true)
        case .registerAsClient:
            self.slideMenuController()?.changeMainViewController(self.registerAsClient, close: true)
        }
    }
}

extension LeftViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if let menu = LeftMenu(rawValue: indexPath.row) {
            switch menu
            {
            case .categories, .registerAsClient:
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
            case .categories, .registerAsClient:
                let cell = BaseTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: BaseTableViewCell.identifier)
                cell.setData(menus[indexPath.row])
                
                return cell
            }
        }
        
        return UITableViewCell()
    }
}































