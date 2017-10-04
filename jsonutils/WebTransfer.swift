//
//  WebTransfer.swift
//  httputils
//
//  Created by Suolapeikko on 24/03/2017.
//

import Foundation

struct WebTransfer {
    
    /// Call HTTP GET asynchronously
    ///
    /// - parameters:
    ///   - String: url in full format, eg.  https://jsonplaceholder.typicode.com/users
    ///   - Dictionary<String: Any>?: parameters as an optional dictionary containing get parameters in name / value format
    ///   - Closure (Dictionary<String: Any>? -> Void): handler for request result
    /// - returns:
    ///     - Dictionary<String: Any>?: an optional dictionary containing JSON contents as name / value pairs
    func callAsyncGet(url: String, parameters: Dictionary<String, String>?, reply: @escaping (Data) -> Void) {

        let urlComp = NSURLComponents(string: url)!
        
        if(parameters != nil) {
            var params = [URLQueryItem]()
            
            for (key,value) in parameters! {
                params.append(URLQueryItem(name: key, value: value))
            }
            
            params = params.filter{!$0.name.isEmpty}
            
            if !params.isEmpty {
                urlComp.queryItems = params
            }
        }
        
        let requestURL = urlComp.url
        
        // Next two lines could be bypassed in there weren't need to explicitly specify HTTP method
        var urlRequest = URLRequest(url: requestURL!)
        urlRequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                let err = error! as NSError
                NSLog("callAsyncGet: \(err.userInfo["NSLocalizedDescription"].unsafelyUnwrapped)")
                return
            }
            guard let data = data else {
                NSLog("callAsyncGet: Data is empty")
                return
            }

            reply(data)
       }
        
        task.resume()
    }
}
