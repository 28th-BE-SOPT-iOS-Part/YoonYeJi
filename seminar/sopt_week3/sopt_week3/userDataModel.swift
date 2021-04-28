//
//  userDataModel.swift
//  sopt_week3
//
//  Created by 윤예지 on 2021/04/26.
//

import Foundation

struct userDataModel
{
    var id : Int
    var username : String
    var email : String
    var adress : adress
    var phone : String
    var website : String
    var company : company
}

struct adress
{
    var street : String
    var suite : String
    var city : String
    var zipcode : String
    var geo : geo
}

struct geo {
    var lat : String
    var lng : String
}


struct company
{
    var name : String
    var catchPhrase : String
    var bs : String
}

