//
//  NetworkAgent.swift
//  movieBookingApp
//
//  Created by Ye Yint Aung on 13/04/2022.
//

import Foundation
import Alamofire

struct NetworkAgent {
    
    static let shared = NetworkAgent()
    
    private init() {
        
    }
    
    func loginWithEmail(email: String, password: String, completion: @escaping (MTResult<EmailLogin>)->Void){
        let parameter : [String:String] = [
            "email" : email,
            "password" : password
        ]
        AF.request(MTEndPoint.emailLogin.url, method: .post, parameters: parameter).responseDecodable(of: EmailLogin.self){ response in
            
            switch response.result{
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(handleError(response, error, MDBCommonResponseError.self)))
            }
        }
    }
    
    func registerWithEmail(name: String,email: String, phone: String, password: String,google: String, facebook: String, completion: @escaping (MTResult<EmailRegister>)->Void ){
        let parameter : [String:String] = [
            "name" : name,
            "email" : email,
            "phone" : phone,
            "password" : password,
            "google-access-token" : google,
            "facebook-access-token" : facebook
        ]
        AF.request(MTEndPoint.emailRegister.url, method: .post, parameters: parameter).responseDecodable(of: EmailRegister.self) { response in
            
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(handleError(response, error, MDBCommonResponseError.self)))
            }
        }
    }
    
    func currentShowing( completion: @escaping (MTResult<CurrentShowingMovieList>)->Void) {
        
        AF.request(MTEndPoint.currentShowing.url).responseDecodable(of: CurrentShowingMovieList.self) { result in
            switch result.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(handleError(result, error, MDBCommonResponseError.self)))
            }
            
        }
        
    }
    
    
    
    
    /*
     
     Network Error - Different Scenarios
     
     *JSON Serialization Error
     *Wrong URL Error
     *Incorrect Methods
     *Missing Credentials
     *4xx
     *5xx
     
     */
    
    //Customize Error Body
    
    private func handleError<T, E: MDBErrorModel>(
        _ response : DataResponse<T, AFError>,
        _ error : (AFError),
        _ errorBodyType : E.Type
    ) -> String {
        var respBody : String = ""
        var serverErrorMessage : String?
        var errorBody : E?
        
        if let respData = response.data {
            respBody = String(data: respData, encoding: .utf8) ?? "Empty Response Body"
            
            errorBody = try? JSONDecoder().decode(errorBodyType, from: respData)
            serverErrorMessage = errorBody?.message
        }
        
        let respCode : Int = response.response?.statusCode ?? 0
        
        let sourcePath : String = response.response?.url?.absoluteString ?? "no url"
        
        
        //1 - Essential Debug Info
        print(
        """
        ==========================
        URL
        ->\(sourcePath)
        
        Status
        ->\(respCode)
        
        Body
        -> \(respBody)
        
        Underlying Error
        -> \(error.underlyingError!)
        
        Error Description
        -> \(error.errorDescription!)
        
        =========================
        
        """
        
        )
        
        return serverErrorMessage ?? error.errorDescription ?? "undefined"
        
        
    }
    
}


protocol MDBErrorModel : Decodable {
    var message : String { get }
}

class MDBCommonResponseError : MDBErrorModel {
    var message: String {
        return statusMessage
    }
    
    let statusMessage : String
    let statusCode : Int
    
    enum CodingKeys : String, CodingKey {
        case statusMessage = "status_message"
        case statusCode = "status_code"
    }
}

enum MTResult<T> {
    case success(T)
    case failure(String)
}


