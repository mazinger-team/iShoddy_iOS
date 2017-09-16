//
//  CategoryCell.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 6/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import UIKit

class CategoryCell:UITableViewCell{
    
    
    @IBOutlet weak var categoryName: UITextField!
    
    @IBOutlet weak var imageBackGround: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelCategory: UILabel!
    
    private var _getFileFromServerInteractor : GetImageFilesInteractor? = nil
    
   
    
    public func startView(category: Category){
        self.labelName.text = category.name
        self.labelCategory.text = "Disponemos de "
        var i = 0;
        
        for subcategory in category.subcategories {
            if( i == 0 ){
                self.labelCategory.text = self.labelCategory.text! + subcategory.name!
            }else{
                self.labelCategory.text = self.labelCategory.text! + ", " + subcategory.name!
            }
            i=i+1
        }
        _getFileFromServerInteractor = GetImageFilesInteractor(getFileFromServerManager: GetFileFromServerManager() )
        
        _getFileFromServerInteractor?.execute(withUrl: URL(string:category.urlLogo)!, completion: { [weak self] (image, animated : Bool) in
            DispatchQueue.main.async {
                
                if( animated ){
                    UIView.transition(with: (self?.imageBackGround)!,
                                      duration: 0.8,
                                      options: [.transitionCrossDissolve],
                                      animations: {
                                        // cambio la imagen
                                        self?.imageBackGround.image = image
                                        self?.imageBackGround.clipsToBounds = true
                    })
                }else{
                    self?.imageBackGround.image = image
                    self?.imageBackGround.clipsToBounds = true
                    
                }
                
            }
            }, onError: { (errorData) in
                print("Se ha producido un error a la hora de cargar una imagen")
            })


    }
    
    
    
}
