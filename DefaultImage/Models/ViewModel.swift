//
//  ViewModel.swift
//  DefaultImage
//
//  Created by Иван Тарасенко on 04.12.2022.
//

import Foundation

protocol ThemeProtocol: AnyObject {
    var systemTheme: ColorTheme {get}
    var lightTheme: ColorTheme {get}
    var darkTheme: ColorTheme {get}
}

class Theme:ThemeProtocol {
    var systemTheme = ColorTheme(background: R.Color.Syslem.system!, image: R.Image.systemImage!)
    var lightTheme = ColorTheme(background: R.Color.light, image: R.Image.ligthImage!)
    var darkTheme = ColorTheme(background: R.Color.dark, image: R.Image.darkImage!)
}
