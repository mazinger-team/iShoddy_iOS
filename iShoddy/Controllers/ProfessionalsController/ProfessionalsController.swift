//
//  ViewController.swift
//  iShoddy
//
//  Created by JJLZ on 7/29/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import UIKit

class ProfessionalsController: UIViewController {
    
    @IBOutlet weak var ProfessionalCollectionView: UICollectionView!
    @IBOutlet weak var professionalActivityIndicator: UIActivityIndicatorView!
    
    var lastContentOffset: CGFloat = 0.0
    
    var popViewController : Dialog!
    
    var professionals : [Professional] =  [Professional]()
    
    var loadingStatus = false
    
    let filter: String? = ""
    let order: String? = ""
    let fields: String? = ""
    var page: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        
        getProfessionals(filter: filter, order: order, fields: fields, page: page)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func getProfessionals(filter: String?, order: String?, fields: String?, page: Int) {
        if !loadingStatus{
            loadingStatus = true
            
            let manager : GetProfessionalsNetworkManager  = GetProfessionalsNetWorkManagerImpl()
            
            let getProfessionalsInteractorImpl: GetProfessionalInteractorImpl = GetProfessionalInteractorImpl(getProfessionalsNetworkManager: manager)
            
            getProfessionalsInteractorImpl.execute(filter: filter, order: order, fields: fields, page: page, completion: { (listProfessionalsResponseType: ListProfessionalsResponseType)  in
                
                    self.professionals.append(contentsOf: listProfessionalsResponseType.listProfessionalsOutputType.professionals)
   
                //self.professionals = listProfessionalsResponseType.listProfessionalsOutputType.professionals
                DispatchQueue.main.async {
                    self.professionalActivityIndicator.isHidden = true
                    self.professionalActivityIndicator.stopAnimating()
                    self.ProfessionalCollectionView.reloadData()
                }
            }, onError: { (errorData : ErrorData) in
                let bundle = Bundle(for: Dialog.self)
                DispatchQueue.main.async {
                    self.popViewController = Dialog(nibName: "Dialog", bundle: bundle)
                    self.popViewController.showInView(self.view, withImage: UIImage(named: "typpzDemo"),withTitle: "Oppssss¡¡¡", withMessage: errorData.errorText, animated: true)
                }
            })
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "DetailProfessionalSegue" {
                let indexPath = ProfessionalCollectionView.indexPathsForSelectedItems?.first
                let vc = segue.destination as! ProfessionalDetailController
                vc.professional = self.professionals[(indexPath?.row)!]
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row + 1 == professionals.count {
            professionalActivityIndicator.isHidden = false
            professionalActivityIndicator.startAnimating()
            loadingStatus = false
            page += 1
            getProfessionals(filter: filter, order: order, fields: fields, page: page)
        } else if indexPath.row + 1 == professionals.count-8  {
            loadingStatus = false
            page += 1
            getProfessionals(filter: filter, order: order, fields: fields, page: page)
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = (self.view.frame.size.width - 12 * 3) / 3 //some width
        let height = width * 1.5 //ratio
        return CGSize(width: width, height: height);
    }
}

