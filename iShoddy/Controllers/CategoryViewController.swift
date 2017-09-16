//
//  CategoryViewController.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 6/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import UIKit


class CategoryViewController: UIViewController {
    
    
    @IBOutlet weak var CategoryTableView: UITableView!
    
    
     var popViewController : Dialog!
    
     var listCategoriesResponseType : ListCategoriesResponseType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurationSearchBar()
        automaticallyAdjustsScrollViewInsets = false

   

        let manager : GetAllCategoriesManager  = GetAllCategorisNetWorkManagerImpl()
        let getAllCategoriesInteractorImpl : GetAllCategoriesInteractorImpl = GetAllCategoriesInteractorImpl(getAllCategoriesManager: manager)
        let saveCategoriesInteractor : SaveCategoriesInteractor = SaveCategoriesInteractorImpl(persistCategoriesCoreData: PersistCategoriesCoreDataImpl(context: self.appDelegate().mContext!) )
        let checkCacheInteractor : CheckCacheInteractor = CheckCacheFakeInteractorImpl( context: self.appDelegate().mContext! )
        
        if ( checkCacheInteractor.refresh() ){
        //Load from NetWork
        getAllCategoriesInteractorImpl.execute(completion: { [weak self] (listCategoriesResponseType: ListCategoriesResponseType)  in
           
            self?.listCategoriesResponseType = listCategoriesResponseType
            saveCategoriesInteractor.execute(categoriesToSave: listCategoriesResponseType.listCategoriesOutputType.categories, completion: {
                (numberRowsSaved) in
                            print("Número de Categorías salvadas %@", numberRowsSaved )
                            DispatchQueue.main.async {
                            saveContext(context: (self?.appDelegate().mContext!)!,
                                        onError: { (errorData:ErrorData) in
                                            self?.showError(withError: errorData)
                })
                }
            }, onError: { (errorData : ErrorData)in
                 self?.showError(withError: errorData)
            })
            
            DispatchQueue.main.async {
                self?.CategoryTableView.reloadData()
                
            }
        }, onError: { (errorData : ErrorData) in
           self.showError(withError: errorData)
        })
        }else{
            //Load from Cache
            let manager : GetAllCategoriesManager  = GetAllCategoriesCoreDataManagerImpl(context: self.appDelegate().mContext! )
            let getAllCategoriesInteractorCoreDataImpl : GetAllCategoriesInteractor = GetAllCategoriesInteractorCoreDataImpl(getAllCategoriesManager: manager)
            
            getAllCategoriesInteractorCoreDataImpl.execute(completion: { [weak self] (listCategoriesResponseType: ListCategoriesResponseType)  in
                self?.listCategoriesResponseType = listCategoriesResponseType
                
                DispatchQueue.main.async {
                self?.CategoryTableView.reloadData()
               //activityIndicator.stopAnimating()
                }
                }, onError: { (errorData : ErrorData) in
                    self.showError(withError: errorData)
            })
            
            
            
        }
    
}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func onMenu(_ sender: AnyObject) {
        if slidingPanelController.sideDisplayed == MSSPSideDisplayed.left {
            slidingPanelController.closePanel()
        } else {
            slidingPanelController.openLeftPanel()
        }
    }
    
    @objc func allOnMenu(_ sender: AnyObject) {
       //Felicidades...te toca a ti...
    }
    
    private func configurationSearchBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu_button")!.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(CategoryViewController.onMenu(_:)))
        //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Todos", style: .plain, target: self, action:  #selector(CategoryViewController.allOnMenu(_:)))
        
        //navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 106, green: 48, blue: 129, alpha: 1.0)
       
        let searchBar = UISearchBar()
        searchBar.tintColor = UIColor.gray
        searchBar.placeholder = "Search";
        
        let width: CGFloat = 50.0 //Calcualte a suitable width based on search bar width, screen size, etc..
        
       
        
       
        
        self.navigationItem.titleView = searchBar;
  
        for subView in searchBar.subviews  {
            for subsubView in subView.subviews  {
                if let textField = subsubView as? UITextField {
                    textField.font = UIFont(name: "Verdana", size: 13)
                    var frameRect = textField.frame
                    frameRect.size.height = 5
                    textField.frame = frameRect
                }
            }
        }
        
    }
    
}




extension CategoryViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = self.listCategoriesResponseType?.listCategoriesOutputType.categories.count else{
               return 0
        }
        return count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CategoryCell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as! CategoryCell
 
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.startView(category: (listCategoriesResponseType?.listCategoriesOutputType.categories[ indexPath.row ])!)
       // cell.imageBackGround?.image = UIImage (named: "electrician")
        
        return cell
        
    }
    
    
}

/*extension CategoryViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        
        return 170;
        
        
    }
    
    
    
}*/




