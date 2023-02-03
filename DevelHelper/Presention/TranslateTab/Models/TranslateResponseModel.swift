//
//  TranslateResponseModel.swift
//  DevelHelper
//
//  Created by 이준혁 on 2023/02/03.
//

import Foundation

struct TranslateResponseModel: Decodable {
    private let message: Message
    
    var translatedText: String { message.result.translatedText }
    
    struct Message: Decodable {
        let result: Result
    }
    
    struct Result: Decodable {
        let translatedText: String
    }
}
