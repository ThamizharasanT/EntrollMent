//
//  EntrollmentFormVc.swift
//  EnrollmentForm
//
//  Created by Ayyapan on 29/09/23.
//

import UIKit
import iOSDropDown

class EntrollmentFormVc: UIViewController {
    
    
    @IBOutlet var TableV: UITableView!
    // drop down view
    @IBOutlet var DropView: UIView!
    
    //Mark  stepper Color Button
    @IBOutlet var Student: UIButton!
    
    @IBOutlet var Parent: UIButton!
    
    @IBOutlet var Contact: UIButton!
    
    @IBOutlet var upload: UIButton!
    
    //Mark  stepper Color Label
    @IBOutlet var StudentLAbel: UILabel!
    
    @IBOutlet var ParentLabel: UILabel!
    
    @IBOutlet var UploadLabel: UILabel!
    
    //Mark  stepper Text Label
    @IBOutlet var StudentTextLAbel: UILabel!
    
    @IBOutlet var ParentTextLabel: UILabel!
    
    @IBOutlet var ContatTextLabel: UILabel!
    
    @IBOutlet var UploadTextLabel: UILabel!
    
    //Mark  Swip Views
    @IBOutlet var OverAllView: UIView!
    
    @IBOutlet var StudentView: UIView!
    
    @IBOutlet var ParentView: UIView!
    
    @IBOutlet var ContactView: UIView!
    
    @IBOutlet var UploadView: UIView!
    
    //Mark  Stepper Currect view Name InSide A label
    @IBOutlet var StudentTopLAbel: UILabel!
    
    //Mark Upload Button Above the Hide Stack View
    @IBOutlet var AdressStack: UIStackView!
    
    @IBOutlet var BirthStack: UIStackView!
    
    @IBOutlet var PassStack: UIStackView!
    
    @IBOutlet var AadharStack: UIStackView!
    
    @IBOutlet var DomileStack: UIStackView!
    
    //Mark Upload Document Button
    @IBOutlet var AddressUploadV: UIButton!
    
    @IBOutlet var BirthUploadV: UIButton!
    
    @IBOutlet var PassUploadV: UIButton!
    
    @IBOutlet var AadharUploadV: UIButton!
    
    @IBOutlet var DomiUploadV: UIButton!
    
    //Mark Upload Document Button below the Underline Labels
    @IBOutlet var AddressUploadUnderline: UILabel!
    
    @IBOutlet var BirthUploadUnderline: UILabel!
    
    @IBOutlet var PassportUploadUnderline: UILabel!
    
    @IBOutlet var AadharUploadUnderline: UILabel!
    
    @IBOutlet var DomileUploadUnderline: UILabel!
    
    //Mark Add Document Button And Show the Document Views
    @IBOutlet var DocumentFirstView: UIView!
    
    @IBOutlet var DocumentSecView: UIView!
    
    @IBOutlet var DocumentthirdView: UIView!
    
    @IBOutlet var DocumentFourView: UIView!
    
    @IBOutlet var DocumentFiveView: UIView!
    
    // Mark Add Document Button And Count the Arrays
    @IBOutlet var DocumentCountLabel: UILabel!
    
    //Mark Add Document Button And Show the Document Views InSide the Labels
    @IBOutlet var DocumentNameOne: UILabel!
    
    
    @IBOutlet var DocumentName2: UILabel!
    
    
    @IBOutlet var DocumentName3: UILabel!
    
    
    @IBOutlet var DocumentName4: UILabel!
    
    
    @IBOutlet var DocumentName5: UILabel!
    
    
    @IBOutlet var AddDocumentBtnOt: UIButton!
    
    @IBOutlet var DocumentCompleted: UIButton!
    
    @IBOutlet var AddDocumentUnderlineLabel: UILabel!
    
    var srr:[String] = ["hrbrb","erhbrgnbrg","ethbth"]
    
    //Student Text Field
    @IBOutlet var StudentFirstName: Textf!
    
    @IBOutlet var MidleName: Textf!
    
    @IBOutlet var LastName: Textf!
    
    @IBOutlet var Gender: DropDown!
    
    @IBOutlet var Dob: Textf!
    
    @IBOutlet var BloodG: Textf!
    
    @IBOutlet var Location: Textf!
    
        //parent textField
    
    @IBOutlet var FatherName: Textf!
    
    @IBOutlet var MotherName: Textf!
    
    @IBOutlet var FatherOccupation: Textf!
    
    @IBOutlet var FatherAnnual: Textf!
    
    @IBOutlet var MotherOccupation: Textf!
    
    @IBOutlet var MatherAnnual: Textf!
    
    //contact Details TextField
    
    @IBOutlet var FatherMobileNumber: Textf!
    
    @IBOutlet var MotherMobileNumber: Textf!
    
    @IBOutlet var StudentMobileNumber: Textf!
    
    @IBOutlet var EmergencyMobileNumber: Textf!
    
    @IBOutlet var FatherEmail: Textf!
    
    @IBOutlet var MotherEmail: Textf!
    
    @IBOutlet var AlternateMobileNum: Textf!
    
    @IBOutlet var AlternateMobileNum2: Textf!
  
    var blood = ["o+","A+","-A","B+"]
    var id  = [1,2,3]
    let prefillTextFields = false
    override func viewDidLoad() {
        super.viewDidLoad()
        let option = ["Male","Female","Others","Male","Female","Others","Male","Female","Others","Male","Female","Others"]
        Gender.optionArray = option
        Gender.textColor = .black
        DropView.isHidden = true

        self.OverAllView.frame.size.height = 600
        NotificationCenter.default.addObserver(self, selector: #selector(EntrollmentFormVc.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(EntrollmentFormVc.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        
        StudentFirstName.leftView = UIView(frame: CGRect(x: 0, y: 0, width: -10, height: StudentFirstName.frame.height))
        StudentFirstName.leftViewMode = .always
//
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func EntrollApi(){
        Apiservice.shared.Api(url: ServiseUrl.EntrollMent, parameter:["school":"tamil","school_token":"72V453NY8WW9","standard_token":"I61R1OX7J244","academic_year_token":"U3C13Q7S78Q1","student_name": "sss","gender":"Male","dob":"07 Aug 2022","blood_group":"O+","father_name":"sss","mother_name":"","father_occupation":"software Developer","mother_occupation":"","father_income":"3000000","mother_income":"","father_number":"9087564123","mother_number":"","student_mobile_number":"9087564123","emergency_contact_number":"9087564123","father_email":"sss@sss.sss","mother_email":"","father_alter_number":"","mother_alter_number":"","location":"sss","image":"https://d3f4i5flr9o011.cloudfront.net/images/IMG_20230807_151734136.jpg","aadhar_card":"https://d3f4i5flr9o011.cloudfront.net/images/IMG_20230807_151734136.jpg","birth_certificate":"https://d3f4i5flr9o011.cloudfront.net/images/IMG_20230807_151734136.jpg","address_proof":"https://d3f4i5flr9o011.cloudfront.net/images/IMG_20230807_151734136.jpg","domicile_certificate":"https://d3f4i5flr9o011.cloudfront.net/images/IMG_20230807_151734136.jpg","other_documents":[ "https://d3f4i5flr9o011.cloudfront.net/images/android_interview_preparation_daimler__1_.pdf","https://d3f4i5flr9o011.cloudfront.net/images/IMG_20230807_151722407.jpg"]], type: "POST", token:""){ (result:Result<EnrollMentsu,Error>) in
            switch result{
            case .success(let succes):
                if succes.status == "Your Application has been Submitted Successfully"{
                    print(succes.status)
                }
                break
                
            case .failure(let failer):
                print(failer.localizedDescription)
                break
            }
            
        }
    }
    func AlertShow(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle:UIAlertController.Style.alert)
        let OkAction = UIAlertAction(title: "ok", style: .default){(action)in
            self.dismiss(animated: true)
        }
        alert.addAction(OkAction)
        self.present(alert, animated: true)
    }
    @IBAction func StudentBtn(_ sender: UIButton) {
        if StudentFirstName!.text?.isEmpty == true{
            AlertShow(title: "", message: "Please Enter the StudentName")
        }else if Gender.text?.isEmpty == true{
            AlertShow(title: "", message: "Please Select the gender")
        }
        else if Dob.text?.isEmpty == true{
            AlertShow(title: "", message: "Please Select the DateOfBirth")
        }
        else if BloodG.text?.isEmpty == true{
            AlertShow(title: "", message: "Please Select the BloodGroup")
        }
        else if Location.text?.isEmpty == true{
            AlertShow(title: "", message: "Please Enter the location")
        }else{
            StudentView.isHidden = true
            ParentView.isHidden = false
            ContactView.isHidden = true
            UploadView.isHidden = true
            StudentTopLAbel.text = "Parent Details"
            ParentTextLabel.textColor = .black
            Parent.tintColor = UIColor(red: 127.0 / 255.0, green: 94.0 / 255.0, blue: 232.0 / 255.0, alpha: 1)
        }
        
        
        
    }
    
    @IBAction func ParentBtn(_ sender: UIButton) {
        
        if FatherName.text?.isEmpty == true &&  MotherName.text?.isEmpty == true{
            AlertShow(title: "", message: "Please Enter the ParentName")
        }
        else if FatherOccupation.text?.isEmpty == true && MotherOccupation.text?.isEmpty == true {
            AlertShow(title: "", message: "Please Enter the ParentOccupation")
        }
        else if FatherAnnual.text?.isEmpty == true && MatherAnnual.text?.isEmpty == true {
            AlertShow(title: "", message: "Please Enter the ParentAnnual")
        }
        else {
            StudentView.isHidden = true
            ParentView.isHidden = true
            ContactView.isHidden = false
            UploadView.isHidden = true
            StudentTopLAbel.text = "Contact Details"
            ContatTextLabel.textColor = .black
            ParentLabel.backgroundColor = UIColor(red: 127.0 / 255.0, green: 94.0 / 255.0, blue: 232.0 / 255.0, alpha: 1)
            Contact.tintColor = UIColor(red: 127.0 / 255.0, green: 94.0 / 255.0, blue: 232.0 / 255.0, alpha: 1)
        }
        
    }
    
    @IBAction func ContactBtn(_ sender: UIButton) {
        if FatherMobileNumber.text?.isEmpty == true &&  MotherMobileNumber.text?.isEmpty == true{
            AlertShow(title: "", message: "Please Enter the ParentMobileNumber")
        }else if StudentMobileNumber.text?.isEmpty == true{
            AlertShow(title: "", message: "Please Enter the StudentMobileNumber")
        }
        else if EmergencyMobileNumber.text?.isEmpty == true {
            AlertShow(title: "", message: "Please Enter the EmergencyMobileNumber")
        }
        else if FatherEmail.text?.isEmpty == true && MotherEmail.text?.isEmpty == true {
            AlertShow(title: "", message: "Please Enter the ParentEmail")
        }else{
            StudentView.isHidden = true
            ParentView.isHidden = true
            ContactView.isHidden = true
            UploadView.isHidden = false
            StudentTopLAbel.text = " Upload Documents"
            UploadTextLabel.textColor = .black
            UploadLabel.backgroundColor = UIColor(red: 127.0 / 255.0, green: 94.0 / 255.0, blue: 232.0 / 255.0, alpha: 1)
            upload.tintColor = UIColor(red: 127.0 / 255.0, green: 94.0 / 255.0, blue: 232.0 / 255.0, alpha: 1)
        }
       
    }
    
    @IBAction func UploadSubBtn(_ sender: UIButton) {
        EntrollApi()
        
    }
    
    @IBAction func BackBtn(_ sender: UIButton) {
        if StudentView.isHidden == false{
            
        }
        else if ParentView.isHidden == false{
            StudentTopLAbel.text = "Student Details"
            StudentView.isHidden = false
            ParentView.isHidden = true
            ParentTextLabel.textColor = UIColor(red: 141.0 / 255.0, green: 141.0 / 255.0, blue: 143.0 / 255.0, alpha: 1)

            Parent.tintColor = UIColor(red: 241.0 / 255.0, green: 241.0 / 255.0, blue: 241.0 / 255.0, alpha: 1)
        }
        else if ContactView.isHidden == false{
            StudentTopLAbel.text = "Parent Details"
            ParentView.isHidden = false
            ParentLabel.backgroundColor = UIColor(red: 241.0 / 255.0, green: 241.0 / 255.0, blue: 241.0 / 255.0, alpha: 1)
            ContatTextLabel.textColor =  UIColor(red: 141.0 / 255.0, green: 141.0 / 255.0, blue: 143.0 / 255.0, alpha: 1)
            Contact.tintColor = UIColor(red: 241.0 / 255.0, green: 241.0 / 255.0, blue: 241.0 / 255.0, alpha: 1)
            ContactView.isHidden = true
        }
        else {
            StudentTopLAbel.text = "Contact Details"
            ContactView.isHidden = false
            UploadLabel.backgroundColor = UIColor(red: 241.0 / 255.0, green: 241.0 / 255.0, blue: 241.0 / 255.0, alpha: 1)
            UploadTextLabel.textColor = UIColor(red: 141.0 / 255.0, green: 141.0 / 255.0, blue: 143.0 / 255.0, alpha: 1)
            upload.tintColor = UIColor(red: 241.0 / 255.0, green: 241.0 / 255.0, blue: 241.0 / 255.0, alpha: 1)
            UploadView.isHidden = true
        }
    }
    

    @IBAction func AddressUpload(_ sender: UIButton) {
        AdressStack.isHidden = false
        AddressUploadV.isHidden = true
        AddressUploadUnderline.isHidden = true
        
    }
    
    @IBAction func BirthUpload(_ sender: UIButton) {
        BirthStack.isHidden = false
        BirthUploadV.isHidden = true
        BirthUploadUnderline.isHidden = true
        
    }
    
    @IBAction func PassportUpload(_ sender: UIButton) {
        PassStack.isHidden = false
        PassUploadV.isHidden = true
        PassportUploadUnderline.isHidden = true
    }
    
    @IBAction func AadharUplaod(_ sender: Any) {
        AadharStack.isHidden = false
        AadharUploadV.isHidden = true
        AadharUploadUnderline.isHidden = true
    }
    
    @IBAction func DomicileUpload(_ sender: UIButton) {
        DomileStack.isHidden = false
        DomiUploadV.isHidden = true
        DomileUploadUnderline.isHidden = true
    }
    
    
    @IBAction func AddressMulti(_ sender: UIButton) {
        AdressStack.isHidden = true
        AddressUploadV.isHidden = false
        AddressUploadUnderline.isHidden = false
    }
    
    @IBAction func BirthMulti(_ sender: UIButton) {
        BirthStack.isHidden = true
        BirthUploadV.isHidden = false
        BirthUploadUnderline.isHidden = false
    }
    
    
    
    @IBAction func PassMulti(_ sender: UIButton) {
        PassStack.isHidden = true
        PassUploadV.isHidden = false
        PassportUploadUnderline.isHidden = false
    }
    
    
    @IBAction func AadharMulti(_ sender: UIButton) {
        AadharStack.isHidden = true
        AadharUploadV.isHidden = false
        AadharUploadUnderline.isHidden = false
    }
    
    
    @IBAction func DomiileMulti(_ sender: UIButton) {
        DomileStack.isHidden = true
        DomiUploadV.isHidden = false
        DomileUploadUnderline.isHidden = false
    }

    
    @IBAction func AddDocument(_ sender: UIButton) {
//        srr.append("newDocument")
        DocumentCountLabel.text = "( Only \(5 - srr.count) docs you can upload )"
        if srr.count == 0{
            DocumentFirstView.isHidden = true
            
            DocumentSecView.isHidden = true
            
            DocumentthirdView.isHidden = true
            
            DocumentFourView.isHidden = true
            
            DocumentFiveView.isHidden = true
        }
        else if srr.count == 1{
            DocumentFirstView.isHidden = false
            
            DocumentSecView.isHidden = true
            
            DocumentthirdView.isHidden = true
            
            DocumentFourView.isHidden = true
            
            DocumentFiveView.isHidden = true
            DocumentNameOne.text = srr[0]
            
        }else if srr.count == 2{
            DocumentFirstView.isHidden = false
            DocumentSecView.isHidden = false
            
            DocumentthirdView.isHidden = true
            
            DocumentFourView.isHidden = true
            
            DocumentFiveView.isHidden = true
            DocumentNameOne.text = srr[0]
            DocumentName2.text = srr[1]
        }
        else if srr.count == 3{
            DocumentFirstView.isHidden = false
            DocumentSecView.isHidden = false
            
            DocumentthirdView.isHidden = false
            
            DocumentFourView.isHidden = true
            
            DocumentFiveView.isHidden = true
            DocumentNameOne.text = srr[0]
            DocumentName2.text = srr[1]
            DocumentName3.text = srr[2]
        }
        else if srr.count == 4{
            DocumentFirstView.isHidden = false
            DocumentSecView.isHidden = false
            
            DocumentthirdView.isHidden = false
            
            DocumentFourView.isHidden = false
            
            DocumentFiveView.isHidden = true
            DocumentNameOne.text = srr[0]
            DocumentName2.text = srr[1]
            DocumentName3.text = srr[2]
            DocumentName4.text = srr[3]
        }
        else{
            DocumentFirstView.isHidden = false
            DocumentSecView.isHidden = false
            
            DocumentthirdView.isHidden = false
            
            DocumentFourView.isHidden = false
            
            DocumentFiveView.isHidden = false
            DocumentNameOne.text = srr[0]
            DocumentName2.text = srr[1]
            DocumentName3.text = srr[2]
            DocumentName4.text = srr[3]
            DocumentName5.text = srr[4]
            AddDocumentBtnOt.isHidden = true
            DocumentCountLabel.isHidden = true
            DocumentCompleted.isHidden = false
            AddDocumentUnderlineLabel.isHidden = true
        }
        
    }
    
    
    @IBAction func DocumentCancel1(_ sender: UIButton) {
//        srr.remove(at: 0)
        DocumentFirstView.isHidden = true
        
    }
    
    @IBAction func DocumentCancel2(_ sender: UIButton) {
//        srr.remove(at: 1)
        DocumentSecView.isHidden = true
        
    }
    @IBAction func DocumentCancel3(_ sender: UIButton) {
//        srr.remove(at: 2)
        DocumentthirdView.isHidden = true
    }
    
    @IBAction func DocumentCancel4(_ sender: UIButton) {
//        srr.remove(at: 3)
        DocumentFourView.isHidden = true
    }
    
    @IBAction func DocumentCancel5(_ sender: UIButton) {
//        srr.remove(at: 4)
        
        DocumentFiveView.isHidden = true
    }

    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
            print("Notification: Keyboard will show")
            TableV.setBottomInset(to: keyboardHeight)
        }
    }
    @objc func keyboardWillHide(notification: Notification) {
        print("Notification: Keyboard will hide")
        TableV.setBottomInset(to: 0.0)
    }
}
extension UITableView {
    func setBottomInset(to value: CGFloat) {
        let edgeInset = UIEdgeInsets(top: 0, left: 0, bottom: value, right: 0)

        self.contentInset = edgeInset
        self.scrollIndicatorInsets = edgeInset
    }
}

class Textf: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
//        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 50))
//          leftViewMode = .always
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1).cgColor
        layer.cornerRadius = 4
        self.layer.masksToBounds = true
    }
}


class CornerRad: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 4
    }
}

//        let paddingView = UITextField(frame: CGRect(x: 0, y: 0, width:10, height: self.frame.size.height))
//               leftView = paddingView
//               leftViewMode = .always
