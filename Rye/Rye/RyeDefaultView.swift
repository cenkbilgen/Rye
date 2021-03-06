//
//  RyeDefaultView.swift
//  Rye
//
//  Created by Andrei Hogea on 12/06/2019.
//  Copyright © 2019 Nodes. All rights reserved.
//

import UIKit

class RyeDefaultView: UIView {
    
    private(set) var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(configuration: RyeConfiguration?) {
        self.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        
        layer.cornerRadius = (configuration?[.cornerRadius] as? CGFloat) ?? 8
        backgroundColor = (configuration?[.backgroundColor] as? UIColor) ?? UIColor.black.withAlphaComponent(0.4)
        
        makeMessageLabel(with: (configuration?[.text] as? String) ?? "Add a message",
                         font: (configuration?[.textFont] as? UIFont) ?? UIFont.systemFont(ofSize: 14, weight: .semibold),
                         textColor: (configuration?[.text] as? UIColor) ?? .white)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Make Subview
    
    private func makeMessageLabel(with text: String, font: UIFont, textColor: UIColor) {
        label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = text
        label.font = font
        label.textColor = textColor
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }
}
