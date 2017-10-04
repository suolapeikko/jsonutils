//
//  main.swift
//  httputils
//
//  Created by Suolapeikko on 24/03/2017.
//

import Foundation

let wt = WebTransfer()
let jc = JSONConverter()
let st = SelfSignedBypassTransfer()

let url1 = "https://jsonplaceholder.typicode.com/posts/1"
let url2 = "https://jsonplaceholder.typicode.com/users"

let parameters = [String:String]()

print("Call for a single item......\n")

wt.callAsyncGet(url: url1, parameters: parameters, reply: { reply in
    
    print(jc.convertJSONToDictionary(json: reply))
})

sleep(2)

print("\nCall for multiple items......\n")

// Call for
wt.callAsyncGet(url: url2, parameters: parameters, reply: { reply in
    
    print(jc.convertJSONToDictionaryArray(json: reply))
})

sleep(2)

print("\nTest site with self signed certificate......\n")

st.selfSignedBypass()

RunLoop.current.run()
