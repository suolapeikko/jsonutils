//
//  SelfSignedBypassTransfer.swift
//  httputils
//
//  Created by Suolapeikko on 04/10/2017.
//

import Foundation

/// Example class to show how to bypass Self Signed Certificate error by implementing URLSessionDelegate methods
class SelfSignedBypassTransfer: NSObject, URLSessionDelegate {
    
 func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
     completionHandler(URLSession.AuthChallengeDisposition.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
     }

 func selfSignedBypass() {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue:OperationQueue.main)
        let url = URL(string: "https://self-signed.badssl.com/")
        let task = session.dataTask(with: url!) { (data, response, error) in
            let string = String(data: data!, encoding: .utf8)!
            print(string)
            exit(0)
        }
        task.resume()
    }
}
