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

        return cell
    }
    
    /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ProfessionalCollectionView.frame.size.width / 2;
        
        return CGSize(width: width, height: ProfessionalCollectionView.frame.size.height)
    }*/
    
    func viewWillTransitionToSize(size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            if let layout = ProfessionalCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                let itemWidth = (view.bounds.width / 3.0)
                let itemHeight = layout.itemSize.height
                layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
                layout.invalidateLayout()
            }
        } else {
            if let layout = ProfessionalCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                let itemWidth = (view.bounds.width / 2.0)-30
                let itemHeight = layout.itemSize.height
                layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
                layout.invalidateLayout()
            }
        }
    }
}
