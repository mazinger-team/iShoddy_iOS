//
//  ProfessionalCell.swift
//  iShoddy
//
//  Created by Jose Sanchez Rodriguez on 10/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import UIKit
import Cosmos

class ProfessionalCell: UICollectionViewCell {
    @IBOutlet weak var professionalNameLabel: UILabel!
    @IBOutlet weak var professionalImageView: UIImageView!
    @IBOutlet weak var professionalCategoryLabel: UILabel!
    @IBOutlet weak var professionalReviewsLabel: UILabel!
    @IBOutlet weak var professionalPhotoCountLabel: UILabel!
    @IBOutlet weak var professionalDistanceLabel: UILabel!
    @IBOutlet weak var professionalRateView: CosmosView!
    
    private var _getFileFromServerInteractor : GetImageFilesInteractor? = nil
    
    //MARK: - Functions
    var i = 0;
    
    var _professional: Professional? = nil
    var professional: Professional{
        get{
            return _professional!
        }
        set{
            _professional = newValue
            
            // Name
            if let corp_name = newValue.corp_name {
                professionalNameLabel.text = corp_name
            }
            
            // Category
            professionalCategoryLabel.text = "No disponible"
            if professional.category?.name != "" {
                professionalCategoryLabel.text = professional.category?.name
            }
            
            // Reviews
            if let reviews = newValue.reviews_number {
                if reviews > 0 {
                    professionalReviewsLabel.text = String(describing: reviews)+" reviews"
                } else {
                    professionalReviewsLabel.text = "No reviews"
                }
            } else {
                professionalReviewsLabel.text = "No reviews"
            }
            
            // Photo Count
            if let photo_number = newValue.photo_number {
                professionalPhotoCountLabel.text = String(describing: photo_number)
            }
            
            // Distance
            if let distance = newValue.distance {
                if distance >= 1000.0 {
                    professionalDistanceLabel.text = String(describing: Int((distance/1000).rounded(.toNearestOrAwayFromZero)))+" km"
                } else {
                    professionalDistanceLabel.text = String(describing: Int(distance.rounded(.toNearestOrAwayFromZero)))+" m"
                }
            }
            
            // Rating
            if let rating = newValue.rating {
                professionalRateView.rating = Double(rating)
            }
            
            // Image
            if let logo_url = newValue.logo_url {
                let defaultImageAsData = try! Data(contentsOf: Bundle.main.url(forResource: constants.ProfessionalImageDefault, withExtension: constants.PngExtension)!)
                
                let asyncData = AsyncData(url: URL(string: logo_url)!, defaultData: defaultImageAsData)
                
                asyncData.delegate = self
                professionalImageView.image = UIImage(data: asyncData.data) // muestra la de ir tirando y empieza a descargar la buena
            } else {
                professionalImageView.image = UIImage(named: constants.ProfessionalImageDefault+constants.PngExtension) // muestra la de ir tirando y empieza a descargar la buena
            }
        }
    }
    /*
     public func startView(professional: Professional){
     self.professionalNameLabel.text = professional.corp_name
     var i = 0;
     
     for category in professional.category! {
     if( i == 0 ) {
     self.professionalCategoryLabel.text = category.name!
     } else {
     self.professionalCategoryLabel.text = category.name!
     }
     i = i + 1
     }
     
     self.professionalReviewsLabel.text = String(describing: professional.reviews_number)
     self.professionalPhotoCountLabel.text = String(describing: professional.photo_number)
     self.professionalDistanceLabel.text = String(describing: professional.distance)
     self.professionalRateView.rating = Double(professional.rating!)
     
     /*
     let defaultImageAsData = try! Data(contentsOf: Bundle.main.url(forResource: constants.ProfessionalImageDefault, withExtension: constants.PngExtension)!)
     
     let asyncData = AsyncData(url: URL(string: professional.logo_url!)!, defaultData: defaultImageAsData)
     
     asyncData.delegate = self
     professionalImageView.image = UIImage(data: asyncData.data) // muestra la de ir tirando y empieza a descargar la buena
     */
     
     _getFileFromServerInteractor = GetImageFilesInteractor(getFileFromServerManager: GetFileFromServerManager() )
     
     _getFileFromServerInteractor?.execute(withUrl: URL(string:professional.logo_url!)!, completion: { [weak self] (image, animated : Bool) in
     DispatchQueue.main.async {
     
     if( animated ){
     UIView.transition(with: (self?.professionalImageView)!,
     duration: 0.8,
     options: [.transitionCrossDissolve],
     animations: {
     // cambio la imagen
     self?.professionalImageView.image = image
     self?.professionalImageView.clipsToBounds = true
     })
     }else{
     self?.professionalImageView.image = image
     self?.professionalImageView.clipsToBounds = true
     }
     }
     }, onError: { (errorData) in
     print("Se ha producido un error a la hora de cargar una imagen")
     })
     }*/
}

extension ProfessionalCell: AsyncDataDelegate{
    
    func asyncData(_ sender: AsyncData, shouldStartLoadingFrom url: URL) -> Bool {
        // Solicita permiso para realizar la descarga
        return true
    }
    
    func asyncData(_ sender: AsyncData, willStartLoadingFrom url: URL) {
        // Nos avisa que va a empezar
    }
    
    func asyncData(_ sender: AsyncData, didEndLoadingFrom url: URL) {
        // Avisa de que finalizó la descarga
        
        // Se actualiza la imagen
        DispatchQueue.main.async {
            // Update UI
            UIView.transition(with: self.professionalImageView,
                              duration: 0.7,
                              options: [.transitionCrossDissolve],
                              animations: {
                                self.professionalImageView.image = UIImage(data: sender.data)
            }, completion: nil)
        }
    }
}


