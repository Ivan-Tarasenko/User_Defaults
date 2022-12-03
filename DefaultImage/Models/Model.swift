//
//  Model.swift
//  DefaultImage
//
//  Created by Иван Тарасенко on 03.12.2022.
//

import UIKit

protocol ColorThemeProtocol {
    var background: UIColor {get}
    var image: UIImage {get}
}

struct ColorTheme: ColorThemeProtocol {
    var background: UIColor
    var image: UIImage
}
