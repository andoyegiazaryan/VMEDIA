//
//  JsonMessage.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/2/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import Foundation

class NetworkCashHelper {
    static let shared = NetworkCashHelper()
    private var value: [Int: Bool] = [:]
    
    private init() {
        
    }
    
    public func end(hash: Int) {
        value[hash] = false
    }
    
    public func canExecute(hash: Int) -> Bool {
        guard let onTheWay = value[hash], onTheWay == true else {
            value[hash] = true
            return true
        }
        return false
    }
}

class JsonMessage<T: Codable>: Codable {
    
    private var params: T
    var method: Methods
    var type: Int = 0
    
    init(method: Methods, param: T) {
        self.params = param
        self.method = method
    }
    
    open var object: T {
        return self.params
    }
    
    func request<R: Codable>(_ useCache: Bool = false, result: R.Type, _ callback: @escaping (_ result: MessageResult<R>) -> ()) {
        var hash = method.hashValue
        if let value = params.toData {
            hash = ("\(hash)" + "\(value.hashValue)").hashValue
        }

        print("Will Execute Request: \(method) with hash: ", hash)

        if !NetworkCashHelper.shared.canExecute(hash: hash) {
            callback(MessageResult.failure(ErrorCode.none))
            return
        }

        func hendle(response: NetworkClientResponse<Any>) {
            
            guard let value = response.data else {
                print("server error \(method)", response.errorCode.localizedDescription)
                callback(MessageResult.failure(response.errorCode))
                NetworkCashHelper.shared.end(hash: hash)
                return
            }

//            (try? JSONSerialization.jsonObject(with: value, options: .allowFragments)).val { print($0) }

            let decode = JSONDecoder()
            do {
                let result = try decode.decode(JsonError.self, from: value)
                print("JsonError", result.localizedDescription)
                callback(MessageResult.failure(result))
                NetworkCashHelper.shared.end(hash: hash)
            }
            catch{
                do{
                    let result = try decode.decode(R.self, from: value)
                    callback(MessageResult.success(result))
                    NetworkCashHelper.shared.end(hash: hash)
                    print(result)
                }
                catch{
                    callback(MessageResult.failure(error))
                    NetworkCashHelper.shared.end(hash: hash)
                }
            }
        }
        print(self.tryEncode)
        let request = NetworkClientRequest(httpMethod: method.httpMethod, method: self.method, param: self.tryEncode,
                                           responseDataCachingEnabled: useCache)
        if useCache == true {
            let cache = NetworkClientCacheRequest(method: self.method)
            cache.startWithExpectedJson(complition: hendle)
        }
        DispatchQueue.global(qos: .utility).async {
            request.startWithExpectedJson(complition: hendle)
        }
    }

    func post() {
        self.request(result: Empty.self) { _ in }
    }
}

extension JsonMessage {
    var tryEncode: JSONParam {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let data = try encoder.encode(self)
            return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? JSONParam ?? [:]
        } catch {
            print(error.localizedDescription)
        }
        return [:]
    }
}


enum MessageResult<T> {
    case success(T)
    case failure(Error)
}

struct Empty: Codable {}
