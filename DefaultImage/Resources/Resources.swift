//
//  Resources.swift
//  DefaultImage
//
//  Created by Иван Тарасенко on 04.12.2022.
//

import UIKit

enum R {
    enum Color {
        static let light = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        static let dark = UIColor(red: 0.130, green: 0.130, blue: 0.130, alpha: 1)

        enum Syslem {
            static let system = UIColor(named: "Theme")
            static let swicher = UIColor(named: "SegmentedSwicher")
            static let controller = UIColor(named: "SegmentedControl")
            static let textColor = UIColor(named: "SegmentTitle")
        }

        enum Light {
            static let swicher = UIColor(named: "LightSwicher")
            static let controller = UIColor(named: "LightControl")
            static let textColor = UIColor(named: "LightTitle")
        }

        enum Dark {
            static let swicher = UIColor(named: "DarkSwicher")
            static let controller = UIColor(named: "DarkControl")
            static let textColor = UIColor(named: "DarkTitle")
        }
    }

    enum Title {
        static let light = "Light"
        static let dark = "Dark"
        static let system = "System"
    }

    enum Image {
        static let systemImage = UIImage(named: "ThemeImage")
        static let ligthImage = UIImage(named: "light")
        static let darkImage = UIImage(named: "dark")
    }
}
