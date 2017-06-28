//
//  Extentions.swift
//  chatAppWithFirebase
//
//  Created by Євген Хижняк on 25.06.17.
//  Copyright © 2017 Євген Хижняк. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func loadImageUsingCacheWithUrlString(profileImageUrl: String) {
        
        self.image = nil
        
        if let cacheImage = imageCache.object(forKey: profileImageUrl as AnyObject) {
            self.image = cacheImage as? UIImage
            return
        }
        
        URLSession.shared.dataTask(with: URL(string: profileImageUrl)!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                if let downloadedImage = UIImage(data: data!) {
                     imageCache.setObject(downloadedImage, forKey: profileImageUrl as AnyObject)
                    self.image = downloadedImage
                }
               
            }
        }).resume()

    }
}
