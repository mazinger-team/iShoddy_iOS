/* 
Copyright (c) 2017 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public struct Professional {
    public var id : Int?
    public var user_id : Int?
    public var user_name : String?
    public var demands_id : Array<String>?
    public var category_id : String?
    public var subcategory_id : String?
    public var corp_name : String?
    public var logo_url : String?
    public var images_url : Array<String>?
    public var description : String?
    public var fiscal_id : String?
    public var street : String?
    public var postal_code : String?
    public var area : String?
    public var city : String?
    public var province : String?
    public var gps_lat : Double?
    public var gps_lon : Double?
    public var web_url : String?
    public var email : String?
    public var telephone : String?
    public var opening_hours : String?
    public var register_date : Date?
    public var rate_visit : Int?
    public var rate_hour : Int?
    public var rate_notes : String?
    public var rating_accumulated : Int?
    public var rating_votes : Int?
    public var rating : Double?
    public var reviews_number : Int?
    public var photo_number : Int?
    public var distance : Double?

    /**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let professionals_list = Professionals.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.
    - returns: Array of Professionals Instances.
     */
    /*
     public class func modelsFromDictionaryArray(array:NSArray) -> [Professionals] {
        var models:[Professionals] = []
        for item in array {
            models.append(Professionals(dictionary: item as! NSDictionary)!)
        }
        return models
    }
     */

    /**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let professionals = Professionals(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.
    - returns: Professionals Instance.
     */
    /*
	required public init?(dictionary: NSDictionary) {
		id = dictionary["id"] as? Int
		user_id = dictionary["user_id"] as? Int
		user_name = dictionary["user_name"] as? String
        demands_id = dictionary["demands_id"] as! NSArray as? Array<Int>
		category_id = dictionary["category_id"] as? Int
		subcategory_id = dictionary["subcategory_id"] as? Int
		corp_name = dictionary["corp_name"] as? String
		logo_url = dictionary["logo_url"] as? String
        images_url = dictionary["images_url"] as! NSArray as? Array<String>
		description = dictionary["description"] as? String
		fiscal_id = dictionary["fiscal_id"] as? String
		street = dictionary["street"] as? String
		postal_code = dictionary["postal_code"] as? Int
		area = dictionary["area"] as? String
		city = dictionary["city"] as? String
		province = dictionary["province"] as? String
		gps_lat = dictionary["gps_lat"] as? Double
		gps_lon = dictionary["gps_lon"] as? Double
		web_url = dictionary["web_url"] as? String
		email = dictionary["email"] as? String
		telephone = dictionary["telephone"] as? Int
		opening_hours = dictionary["opening_hours"] as? String
		register_date = dictionary["register_date"] as? Int
		rate_visit = dictionary["rate_visit"] as? Int
		rate_hour = dictionary["rate_hour"] as? Int
		rate_notes = dictionary["rate_notes"] as? String
		rating_accumulated = dictionary["rating_accumulated"] as? Int
		rating_votes = dictionary["rating_votes"] as? Int
		rating = dictionary["rating"] as? Int
	}
    */
    /**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
     */
    /*
	public func dictionaryRepresentation() -> NSDictionary {
		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.user_id, forKey: "user_id")
		dictionary.setValue(self.user_name, forKey: "user_name")
		dictionary.setValue(self.category_id, forKey: "category_id")
		dictionary.setValue(self.subcategory_id, forKey: "subcategory_id")
		dictionary.setValue(self.corp_name, forKey: "corp_name")
		dictionary.setValue(self.logo_url, forKey: "logo_url")
		dictionary.setValue(self.description, forKey: "description")
		dictionary.setValue(self.fiscal_id, forKey: "fiscal_id")
		dictionary.setValue(self.street, forKey: "street")
		dictionary.setValue(self.postal_code, forKey: "postal_code")
		dictionary.setValue(self.area, forKey: "area")
		dictionary.setValue(self.city, forKey: "city")
		dictionary.setValue(self.province, forKey: "province")
		dictionary.setValue(self.gps_lat, forKey: "gps_lat")
		dictionary.setValue(self.gps_lon, forKey: "gps_lon")
		dictionary.setValue(self.web_url, forKey: "web_url")
		dictionary.setValue(self.email, forKey: "email")
		dictionary.setValue(self.telephone, forKey: "telephone")
		dictionary.setValue(self.opening_hours, forKey: "opening_hours")
		dictionary.setValue(self.register_date, forKey: "register_date")
		dictionary.setValue(self.rate_visit, forKey: "rate_visit")
		dictionary.setValue(self.rate_hour, forKey: "rate_hour")
		dictionary.setValue(self.rate_notes, forKey: "rate_notes")
		dictionary.setValue(self.rating_accumulated, forKey: "rating_accumulated")
		dictionary.setValue(self.rating_votes, forKey: "rating_votes")
		dictionary.setValue(self.rating, forKey: "rating")
        dictionary.setValue(self.demands_id, forKey: "demands_id")
        dictionary.setValue(self.images_url, forKey: "images_url")

		return dictionary
	}
     */
}
