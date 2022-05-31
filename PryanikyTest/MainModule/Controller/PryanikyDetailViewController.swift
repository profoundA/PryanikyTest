//
//  PryanikyDetailViewController.swift
//  PryanikyTest
//
//  Created by Andrey Lobanov on 30.05.2022.
//

import UIKit

class PryanikyDetailViewController: UIViewController {
    
    let label = UILabel().next {
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    let imageView = UIImageView().next {
        $0.backgroundColor = .clear
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(imageView)
        
        label.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.width.equalTo(150)
        }
    }
}
