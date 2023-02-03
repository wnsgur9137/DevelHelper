//
//  Language.swift
//  DevelHelper
//
//  Created by 이준혁 on 2023/02/03.
//

import Foundation

enum Language: String, CaseIterable, Codable {
    case ko
    case en
    case ja
    case ch
    case ru
    
    var title: String {
        switch self {
        case .ko: return "Korean".localized()
        case .en: return "English".localized()
        case .ja: return "Japanese".localized()
        case .ch: return "Chinese".localized()
        case .ru: return "Russian".localized()
        }
    }
    
    var languageCode: String {
        self.rawValue
    }
}
