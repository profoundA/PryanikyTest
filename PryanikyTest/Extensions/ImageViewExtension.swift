//
//  ImageViewExtension.swift
//  PryanikyTest
//
//  Created by Andrey Lobanov on 27.05.2022.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(imageUrl: String) {
            self.kf.setImage(with: URL(string: imageUrl))
        }

}
