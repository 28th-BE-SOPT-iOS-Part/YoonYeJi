//
//  SignUpDataModel.swift
//  KaKaoTalk
//
//  Created by 윤예지 on 2021/05/13.
//

import Foundation

struct SignUpDataModel: Codable {
    let success: Bool
    let message: String
    let data: SignUpData?
    
    enum CodingKeys: String, CodingKey {
        case success
        case message
        case data
    }
    
    init(from decoder : Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(SignUpData.self, forKey: .data)) ?? nil
    }
}


struct SignUpData: Codable {
    let userNickname: String
    
    enum CodingKeys: String, CodingKey {
        case userNickname = "nickname"
    }
}
