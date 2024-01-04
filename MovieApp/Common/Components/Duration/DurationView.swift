//
//  DurationView.swift
//  MovieApp
//
//  Created by Linconl Rufino on 23/12/23.
//

import UIKit
import SwiftUI

class DurationView: UIView {
    
    private lazy var clock: UIImageView = {
        clock = UIImageView()
        clock.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(
            pointSize: 12,
            weight: .medium
        )
        clock.image = UIImage(
            systemName: "clock",
            withConfiguration: configuration
        )
        clock.tintColor = .black
        return clock
    }()
    
    private lazy var label: UILabel = {
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Mulish-Regular", size: 12)
        label.text = "0h 0m"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func layout(){
        addSubview(clock)
        addSubview(label)
        
        buildViewConstraints()
    }
    
    private func buildViewConstraints() {
        NSLayoutConstraint.activate([
            clock.centerYAnchor.constraint(equalTo: centerYAnchor),
            clock.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            label.leadingAnchor.constraint(equalTo: clock.trailingAnchor, constant: 4),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
    }
    
    public func configure(_ duration: String){
        label.text = duration
    }
    
}

// MARK: - Preview
struct DurationView_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }

    struct Container: UIViewRepresentable {
        func updateUIView(_ uiView: DurationView, context: Context) {}
        
        func makeUIView(context: Context) -> DurationView {
            return DurationView()
        }
    }
}
