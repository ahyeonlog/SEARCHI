//
//  UIImageView+Kingfisher.swift
//  SEARCHI
//
//  Created by Ahyeonway on 2022/04/01.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with urlString: String) {
        let cache = ImageCache.default
        cache.retrieveImage(forKey: urlString, options: nil) { result in
            switch result {
            case .success(let image):
                // 캐시에서 키를 통해 이미지를 가져온다.
                if let image = image.image {
//                    print("cache")
                    self.image = image
                } else {
//                    print("no cache")
                    guard let url = URL(string: urlString) else {
                        return
                    }
                    // URL로부터 이미지를 다운받고 String 타입의 URL을 캐시키로 지정 후 set
                    let resource = ImageResource(
                        downloadURL: url,
                        cacheKey: urlString
                    )
                    self.kf.setImage(with: resource)
                }
            case .failure(_):
                self.image = UIImage(systemName: "star")
            }
            
        }
    }
}
