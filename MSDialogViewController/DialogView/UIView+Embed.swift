//
//  UIView+Embed.swift
//  Yajood
//
//  Created by Maher Santina on 11/13/17.
//  Copyright © 2017 Alaa Khodor. All rights reserved.
//

import UIKit

infix operator |>

extension UIView{
    /**
     Embeds a view inside another view
     - Parameter left: Embedded
     - Parameter right: Embeddee
     */
    public static func |> (left: UIView, right: UIView){
        right.addSubview(left)
        left.translatesAutoresizingMaskIntoConstraints = false
        right.layer.masksToBounds = false
        
        right.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: ["view":left]))
        right.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: ["view":left]))
    }
}
