//
//  NetworkResult.swift
//  KaKaoTalk
//
//  Created by 윤예지 on 2021/05/11.
//

import Foundation

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
