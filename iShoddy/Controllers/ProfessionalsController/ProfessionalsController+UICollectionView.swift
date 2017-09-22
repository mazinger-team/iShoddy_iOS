//
//  ProfessionalsController+UICollectionView.swift
//  iShoddy
//
//  Created by Jose Sanchez Rodriguez on 9/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import UIKit

extension ProfessionalsController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return constants.professionalCollectionViewNumberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return professionals.count
    }
    
    // Función que retorna el item sobre el que se está realizando una acción
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: constants.ProffesionalCollectionViewCell, for: indexPath) as! ProfessionalCell
        cell.professional = self.professionals[indexPath.row]

        // Corner radius
        cell.layer.masksToBounds = true;
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 1.0
        cell.layer.cornerRadius = 10.0
        cell.layer.borderWidth = 1.0
        
        // Cell shadow
        /*cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width:0,height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false;
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath*/
        
        return cell
    }
}
