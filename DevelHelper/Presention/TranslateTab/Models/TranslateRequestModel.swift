//
//  TranslateRequestModel.swift
//  DevelHelper
//
//  Created by 이준혁 on 2023/02/03.
//

import Foundation

struct TranslateRequestModel: Codable {
    let source: String
    let target: String
    let text: String
}
