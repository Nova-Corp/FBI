//
//  CommonFile.swift
//  FBI
//
//  Created by ADMIN on 01/10/19.
//  Copyright © 2019 Success Resource Pte Ltd. All rights reserved.
//

import Foundation
import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit
import FBSDKPlacesKit
import FacebookShare

class CommonFile {
    private init() {}
    static let sharedInstance = CommonFile()
    
    
    
}

extension UIImageView {
    func downloadedImage(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    func downloadedImage(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloadedImage(from: url, contentMode: mode)
    }
    
}
