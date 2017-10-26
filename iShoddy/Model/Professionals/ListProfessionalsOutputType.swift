//
//  ListProfessionalsOutputType
//  iShoddy
//
//  Created by Jose Sanchez Rodriguez on 11/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

public class ListProfessionalsOutputType {
    public var professionals : [Professional]
    
    init() {
        professionals = [Professional] ()
    }
    
    init(dictionary: [String : Any]) {
        professionals = [Professional]()
        
        if let arrayProfessional = dictionary["professionals"] as? Array<[String : Any]>{
            for professionalDictionary in arrayProfessional as Array {
                var category = CategoryProfessionalList(id: "", name: "")
                
                if (professionalDictionary["category"] != nil) {
                    category = CategoryProfessionalList(dictionary: professionalDictionary["category"] as! Dictionary<String, Any>)!
                }
                
                //  if let category = professionalDictionary["category.name"] as? String {
                //      for cat in category {
                //          category = CategoryProfessionalList(dictionary: cat)
                //      }
                //  }
                
                let professional = Professional(id: professionalDictionary["_id"] as? String,
                                                user_name: professionalDictionary["user_name"] as? String,
                                                corp_name: professionalDictionary["corp_name"] as? String,
                                                category: category,
                                                logo_url: professionalDictionary["logo_url"] as? String,
                                                rating: professionalDictionary["rating"] as? Double,
                                                reviews_number: professionalDictionary["reviews_number"] as? Int,
                                                photo_number: professionalDictionary["photo_number"] as? Int,
                                                distance: professionalDictionary["distance"] as? Double)
                
                professionals.append(professional)
            }
        }
    }
}

