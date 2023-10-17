//
//  ApiService.swift
//  EnrollmentForm
//
//  Created by Ayyapan on 09/10/23.
//

import Foundation
class Apiservice:NSObject,URLSessionDelegate{
    static let shared = Apiservice()
    let pinnedSession = URLSession(configuration: .default)
    override private init(){
        super.init()
    }
    func Api<T:Decodable>(url:String,parameter:[String:Any?],type:String,token:String,compiler: @escaping(Swift.Result<T,Error>) -> Void){
        if let url = URL(string: ServiseUrl.base + url){
            pinnedSession.dataTask(with: URLRequest(url: url,type: type,parameter: parameter as [String : Any],token: token )){(data,response,Error) in
                if let httpResponse = response as? HTTPURLResponse,httpResponse.statusCode == 200,let data = data{
                    do{
                        let result = try JSONDecoder().decode(T.self, from: data)
                        compiler(.success(result))
                    }catch let decodeError {
                        if let resultJson =  try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]{
                            print("Data decoding  failed at : \(url)")
                            print(decodeError)
                            print(resultJson as Any)
                            if let message = resultJson["message"] as? String{
                                let error = self.getError(code: httpResponse.statusCode, description: message)
                                compiler(.failure(error))
                            }else{
                                compiler(.failure(decodeError))
                            }
                        }else{
                            compiler(.failure(decodeError))
                        }
                    }
                    
                }
            }.resume()
        }
    }
    
    func URLRequest(url:URL,type:String,parameter:[String:Any]?,token:String)->URLRequest{
        var URlRequest = Foundation.URLRequest(url: url)
        URlRequest.httpMethod = type
        URlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        URlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URlRequest.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        guard type == "POST" else{
            return URlRequest
        }
        if let parameter = parameter{
            do{
                let jsonData = try JSONSerialization.data(withJSONObject: parameter)
                print(jsonData)
                URlRequest.httpBody = jsonData
            }catch let jsonError{
                print(jsonError.localizedDescription)
                }
        }
        return URlRequest
    }
    func getError(code:Int,description:String)->Error {
        let userInfo: [String : Any] = [
            NSLocalizedDescriptionKey :  NSLocalizedString("Unauthorized", value: description, comment: "")
        ]
        return NSError(domain: "\(code)", code: code, userInfo: userInfo)
    }
    
}
enum MyError: Error {
    case runtimeError(String)
}
