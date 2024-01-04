//
//  SeeMoreButton.swift
//  MovieApp
//
//  Created by Linconl Rufino on 27/11/23.
//

import UIKit

class SeeMoreButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func layout(){
        titleLabel?.font = UIFont(name: "Mulish-Regular", size: 10)
        titleLabel?.textAlignment = .center
        layer.borderWidth = 1
        layer.borderColor = UIColor.SeeMoreButtonColor.cgColor
        layer.cornerRadius = 10
    }
}

