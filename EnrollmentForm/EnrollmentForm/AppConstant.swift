//
//  AppConstant.swift
//  EnrollmentForm
//
//  Created by Ayyapan on 09/10/23.
//

import Foundation
enum Environment:String{
    case Api = "https://heycampus.site/api/parent-app/V1.2/"
    
}
struct AppConficuration{
    static let App = Environment.Api
}
struct ServiseUrl{
    static let base           = AppConficuration.App.rawValue
    static let EntrollMent    = "enrollment"
}
