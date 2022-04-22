//
//  EndPoints.swift
//  movieBookingApp
//
//  Created by Ye Yint Aung on 13/04/2022.
//

import Foundation
import Alamofire

enum MTEndPoint : URLConvertible {
    case emailLogin
    case emailRegister
    case currentShowing
    case comingSoon
    
    
    private var baseurl : String {
        return baseUrl
    }
    
    func asURL() throws -> URL {
        return url
    }
    
    
    var url : URL {
        let urlComponents = NSURLComponents(string: baseUrl.appending(apiPath))
        
        if(urlComponents?.queryItems == nil){
            urlComponents!.queryItems = []
        }
        urlComponents!.queryItems!.append(contentsOf: [URLQueryItem(name: "api_key", value: apiKey)])
        return urlComponents!.url!
    }
    
    
    private var apiPath : String {
        switch self {
        case .emailLogin :
            return "/api/v1/email-login"
        case .emailRegister:
            return "/api/v1/register"
        case .currentShowing:
            return "/api/v1/movies?status=current&take=10"
        case .comingSoon:
            return "/api/v1/movies?status=comingsoon&take=10"
        }
    }
    
}

