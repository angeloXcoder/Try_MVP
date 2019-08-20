//
//  LoginManager.swift
//  Try_MVP
//
//  Created by Mac on 8/20/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

enum GetFriendsFailureReason: Int, Error {
    case unAuthorized = 401
    case notFound = 404
}

class LoginInteractor: NSObject {
    private let disposeBag    = DisposeBag()
    static let sharedInstance = LoginInteractor()
    var manager = Alamofire.SessionManager()
    private override init()
    {
        super.init()
        
    }
    
    func loginUser(url: String, withParameters: NSDictionary) -> Observable<Json4Swift_Base>  {
        return Observable.create {
            observer -> Disposable in
            Alamofire
                .request(url, method: .post,
                         parameters: withParameters as? Parameters,
                         encoding: JSONEncoding(options: []),
                         headers: nil)
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        guard let data = response.data else {
            
                            observer.onError(response.error ?? GetFriendsFailureReason.notFound)
                            return
                        }
                        do {
                            
                            let jsonDecoder = JSONDecoder()
                            let responseModel = try jsonDecoder.decode(Json4Swift_Base.self, from: data)
                            print("\(responseModel)")
                            observer.onNext(responseModel)
                        } catch {
                            observer.onError(error)
                        }
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode,
                            let reason = GetFriendsFailureReason(rawValue: statusCode)
                        {
                            observer.onError(reason)
                        }
                        observer.onError(error)
                    }           }
            
            return Disposables.create()
        }
    }
}

            

