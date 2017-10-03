//
//  ViewController.swift
//  iShoddy
//
//  Created by JJLZ on 7/29/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import UIKit
import CoreLocation

class ProfessionalsController: UIViewController {
    
    @IBOutlet weak var ProfessionalCollectionView: UICollectionView!
    @IBOutlet weak var professionalActivityIndicator: UIActivityIndicatorView!
    
    var listProfessionalsResponseType : ListProfessionalsResponseType?
    
    var lastContentOffset: CGFloat = 0.0
    
    var popViewController : Dialog!
    
    var professionals : [Professional] =  [Professional]()
    
    public var paginationDataProfessional : PaginationData = PaginationData(paginationFlag: false, paginationKey: 0, paginationElements: 0)
    
    var loadingStatus = false
    
    var filter: String? = ""
    let order: String? = ""
    var fields: String? = ""
    
    var gps_lat: Double? = 0
    var gps_lon: Double? = 0
    
    var locationManager : CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // If location services is enabled get the users location
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.requestWhenInUseAuthorization()
            locationManager?.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest // You can change the locaiton accuary here.
            locationManager?.startUpdatingLocation()
            locationManager?.requestLocation()
            if let location = locationManager?.location?.coordinate {
                gps_lat = location.latitude
                gps_lon = location.longitude
            }
        }
        
        automaticallyAdjustsScrollViewInsets = false
        
        if (gps_lat != 0 && gps_lon != 0) {
            filter = "gps_lat=" + String(describing: gps_lat!)
            filter = filter! + "&gps_lon=" + String(describing: gps_lon!)
        }
        
        getProfessionals(filter: filter, order: order, fields: fields, page: paginationDataProfessional.paginationKey)
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager?.stopUpdatingLocation()
        }
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
            
            getProfessionalsInteractorImpl.execute(filter: filter, order: order, fields: fields, page: page, completion: { (listProfessionalsResponseType: ListProfessionalsResponseType, paginationDataResponseType: PaginationDataResponseType)  in
                //self.listProfessionalsResponseType = listProfessionalsResponseType
                
                self.professionals.append(contentsOf: listProfessionalsResponseType.listProfessionalsOutputType.professionals)
                self.paginationDataProfessional = paginationDataResponseType.paginationDataOutputType.paginationData
                
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
            if identifier == constants.professionalDetailSegue {
                let indexPath = ProfessionalCollectionView.indexPathsForSelectedItems?.first
                let vc = segue.destination as! ProfessionalDetailController
                vc.professional = self.professionals[(indexPath?.row)!]
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (paginationDataProfessional.paginationFlag) {
            if indexPath.row + 1 == professionals.count {
                professionalActivityIndicator.isHidden = false
                professionalActivityIndicator.startAnimating()
                loadingStatus = false
                
                if (paginationDataProfessional.paginationKey == 0) {
                    paginationDataProfessional.paginationKey = 2
                } else {
                    paginationDataProfessional.paginationKey += 1
                }
                
                getProfessionals(filter: filter, order: order, fields: fields, page: paginationDataProfessional.paginationKey)
            } else if indexPath.row + 1 == professionals.count-8  {
                loadingStatus = false
                if (paginationDataProfessional.paginationKey == 0) {
                    paginationDataProfessional.paginationKey = 2
                } else {
                    paginationDataProfessional.paginationKey += 1
                }
                getProfessionals(filter: filter, order: order, fields: fields, page: paginationDataProfessional.paginationKey)
            }
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = (self.view.frame.size.width - 12 * 3) / 3 //some width
        let height = width * 1.5 //ratio
        return CGSize(width: width, height: height);
    }
}

