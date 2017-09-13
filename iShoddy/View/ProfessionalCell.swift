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
    
    //MARK: - Functions
    var _professional: Professional? = nil
    var professional: Professional{
        get{
            return _professional!
        }
        set{
            _professional = newValue
            
            professionalNameLabel.text = newValue.corp_name
            professionalCategoryLabel.text = String(describing: newValue.category_id)
            if let reviews = newValue.rating {
                professionalReviewsLabel.text = reviews+" reviews"
                
            } else {
                professionalReviewsLabel.text = "No reviews"
                
            }
            professionalPhotoCountLabel.text = String(describing: newValue.rating!)
            professionalDistanceLabel.text = newValue.city!
            professionalRateView.rating = Double(newValue.rating!)!
            
            let defaultImageAsData = try! Data(contentsOf: Bundle.main.url(forResource: constants.ProfessionalImageDefault, withExtension: constants.PngExtension)!)
            
            let asyncData = AsyncData(url: URL(string: newValue.logo_url!)!, defaultData: defaultImageAsData)
            
            asyncData.delegate = self
            professionalImageView.image = UIImage(data: asyncData.data) // muestra la de ir tirando y empieza a descargar la buena
        }
    }
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
