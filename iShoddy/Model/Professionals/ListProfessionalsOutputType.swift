/* 
Copyright (c) 2017 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class ListProfessionalsOutputType {
    public var professionals : [Professional]
    
    
    init(dictionary: [String : Any]) {
        professionals = [Professional]()
        
        if let arrayProfessional = dictionary["professionals"] as? Array<[String : Any ]>{
            for professionalDictionary in arrayProfessional as Array {
                let professional = Professional(id: professionalDictionary["id"] as? Int,
                                                user_id: professionalDictionary["user_id"] as? Int,
                                                user_name: professionalDictionary["user_name"] as? String,
                                                demands_id: professionalDictionary["demands_id"] as? Array<String>,
                                                category_id: professionalDictionary["category_id"] as? String,
                                                subcategory_id: professionalDictionary["subcategory_id"] as? String,
                                                corp_name: professionalDictionary["corp_name"] as? String,
                                                logo_url: professionalDictionary["logo_url"] as? String,
                                                images_url: professionalDictionary["images_url"] as? Array<String>,
                                                description: professionalDictionary["description"] as? String,
                                                fiscal_id: professionalDictionary["fiscal_id"] as? String,
                                                street: professionalDictionary["street"] as? String,
                                                postal_code: professionalDictionary["postal_code"] as? String,
                                                area: professionalDictionary["area"] as? String,
                                                city: professionalDictionary["city"] as? String,
                                                province: professionalDictionary["province"] as? String,
                                                gps_lat: professionalDictionary["gps_lat"] as? Double,
                                                gps_lon: professionalDictionary["gps_lon"] as? Double,
                                                web_url: professionalDictionary["web_url"] as? String,
                                                email: professionalDictionary["email"] as? String,
                                                telephone: professionalDictionary["telephone"] as? String,
                                                opening_hours: professionalDictionary["opening_hours"] as? String,
                                                register_date: professionalDictionary["register_date"] as? Date,
                                                rate_visit: professionalDictionary["rate_visit"] as? Int,
                                                rate_hour: professionalDictionary["rate_hour"] as? Int,
                                                rate_notes: professionalDictionary["rate_notes"] as? String,
                                                rating_accumulated: professionalDictionary["rating_accumulated"] as? Int,
                                                rating_votes: professionalDictionary["rating_votes"] as? Int,
                                                rating: professionalDictionary["rating"] as? Double,
                                                reviews_number: professionalDictionary["reviews_number"] as? Int,
                                                photo_number: professionalDictionary["photo_number"] as? Int,
                                                distance: professionalDictionary["distance"] as? Double)
                
                professionals.append(professional)
            }
        }
        
    }

    /**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let listProfessionalsOutputType_list = ListProfessionalsOutputType.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.
    - returns: Array of ListProfessionalsOutputType Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [ListProfessionalsOutputType] {
        var models:[ListProfessionalsOutputType] = []
        for item in array {
            models.append(ListProfessionalsOutputType(dictionary: (item as! NSDictionary) as! [String : Any]))
        }
        return models
    }

    /**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let listProfessionalsOutputType = ListProfessionalsOutputType(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.
    - returns: ListProfessionalsOutputType Instance.
     */
	//required public init?(dictionary: NSDictionary) {
    //    if (dictionary["professionals"] != nil) { professionals = Professional.modelsFromDictionaryArray(array: dictionary["professionals"] as! NSArray) }
	//}

    /**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
     */
	public func dictionaryRepresentation() -> NSDictionary {
		let dictionary = NSMutableDictionary()
        
		return dictionary
	}
}
