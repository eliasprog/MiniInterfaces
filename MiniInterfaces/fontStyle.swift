//
//  fontStyle.swift
//  MiniInterfaces
//
//  Created by Lucas Oliveira on 01/05/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import Foundation
import UIKit

func sfRounded(size: CGFloat, weight: UIFont.Weight) -> UIFont{
    
    let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
    let descriptor = systemFont.fontDescriptor.withDesign(.rounded)
    
    let roundedFont = UIFont(descriptor: descriptor!, size: size)
    
    return roundedFont
}
