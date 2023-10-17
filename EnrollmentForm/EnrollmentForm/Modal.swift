//
//  Modal.swift
//  EnrollmentForm
//
//  Created by Ayyapan on 09/10/23.
//

import Foundation



struct EnrollMentsu:Decodable{
    let status:String
    let message: String?
    let data: String?
    
}
struct EnrollMent{
    let school : String
    let school_token : String
    let standard_token : String
    let academic_year_token : String
    let student_name : String
    let gender : String
    let dob : String
    let blood_group : String
    let father_name : String
    let mother_name : String
   let father_occupation: String
    let mother_occupation: String
    let father_income: String
    let mother_income: String
    let father_number : String
    let mother_number : String
    let student_mobile_number : String
    let emergency_contact_number : String
    let father_email : String
    let mother_email : String
    let father_alter_number : String
    let mother_alter_number : String
    let location : String
    let image : String
    let aadhar_card : String
    let birth_certificate : String
    let address_proof : String
    let domicile_certificate : String
    let other_documents : [String]
}
//struct Document{
//    let document:String
//}
