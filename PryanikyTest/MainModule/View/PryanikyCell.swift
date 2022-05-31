//
//  PryanikyCell.swift
//  PryanikyTest
//
//  Created by Andrey Lobanov on 27.05.2022.
//

import UIKit
import SnapKit

class PryanikyCell: UITableViewCell {
    
    private let label = UILabel().next {
        $0.text = "111"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        label.snp.makeConstraints {
            $0.centerX.centerY.equalTo(contentView)
        }
    }
    
    var setup: DataArray? {
        didSet {
            label.text = setup?.name
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
