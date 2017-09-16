//
//  GetFileFromServerManager.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 12/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation


public class GetFileFromServerManager{

    public func execute(withUrl: URL, completion: @escaping ((UIImage, Bool) -> Void) , onError: @escaping errorBlock) {
      let documentsUrl:URL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as URL!
      let destinationFileUrl = documentsUrl.appendingPathComponent(withUrl.lastPathComponent)
        
        if( FileManager.default.fileExists(atPath: destinationFileUrl.path )){
            completion ( getImage(url:destinationFileUrl ), false )
        }else{
        
        NetworkManager.sharedNetworkManager.downloadFileFromServer(withURL: withUrl, andSaveTo: destinationFileUrl, completion: {
            completion ( self.getImage(url:destinationFileUrl ), true )
      }) {
            (errorData) in
                    print("EERRRRRor")
            }
        }
        
    }
    
    private func getImage(url: URL) -> UIImage {
         do{
            let dataImage:Data = try Data(contentsOf: url)
            return UIImage(data: dataImage)!
         }catch{
            
        }
        return UIImage(named: "empty")!
    }
    
}
