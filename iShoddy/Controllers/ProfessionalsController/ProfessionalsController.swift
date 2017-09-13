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
    
    var popViewController : Dialog!
    
    var professionals : [Professional] =  [Professional]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager : GetAllProfessionalsNetworkManager  = GetAllProfessionalsNetWorkManagerImpl()
        let getAllProfessionalsInteractorImpl: GetAllProfessionalInteractorImpl = GetAllProfessionalInteractorImpl(getAllProfessionalsNetworkManager: manager)
        
        getAllProfessionalsInteractorImpl.execute(completion: { (listProfessionalsResponseType: ListProfessionalsResponseType)  in
            
            self.professionals = listProfessionalsResponseType.listProfessionalsOutputType.professionals
            
            DispatchQueue.main.async {
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
}

