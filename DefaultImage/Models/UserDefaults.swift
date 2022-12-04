//
//  UserDefaults.swift
//  DefaultImage
//
//  Created by Иван Тарасенко on 04.12.2022.
//

import Foundation

protocol SaveSegmentProtorol {
    var segment: Int? {get set}
}

private struct KeysDefaults {
    static let keySegment = "segment"
}

final class SaveSegment: SaveSegmentProtorol {
    private let defaults = UserDefaults.standard

    // Save selected segment index
    var segment: Int? {
        get {
            return defaults.integer(forKey: KeysDefaults.keySegment)
        }
        set {
            if let segment = newValue {
                defaults.set(segment, forKey: KeysDefaults.keySegment)
            }
        }
    }
}
