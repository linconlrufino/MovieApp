//
//  SeeMoreView.swift
//  MovieApp
//
//  Created by Linconl Rufino on 26/11/23.
//

import UIKit

class SeeMoreView: UICollectionReusableView {

    static let identifier = "seeMoreId"
    
    let label = UILabel()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        label.text = "Title - See More"
        
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
