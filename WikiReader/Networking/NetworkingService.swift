//
//  Networking.swift
//  WikiReader
//
//  Created by Višeslav Šako on 27/08/2018.
//  Copyright © 2018 viseslav. All rights reserved.
//

import Foundation
import Alamofire

class NetworkingService
{

    func getRandomArticles(completion: @escaping (_ wikiRandomResponse : WikiRandomResponse?) -> Void)
    {
        guard let url = URL(string: "https://en.wikipedia.org/w/api.php?format=json&action=query&generator=random&grnnamespace=0&grnlimit=5") else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue

        Alamofire.request(request).responseData
            {
                response in switch response.result
                {
                case .success(let data):
                    let decoder = JSONDecoder()
                    do {
                        let wikiRandomResponse = try decoder.decode(WikiRandomResponse.self, from: data)
                        completion(wikiRandomResponse)
                    } catch let error {
                        print("Parsing failed with error: \(error)")
                    }
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
        }
    }
    
    func getArticleContetnt(completion: @escaping (_ wikiTextResponse : WikiTextResponse?) -> Void)
    {
        guard let url = URL(string: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro=&explaintext=&titles=") else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        
        Alamofire.request(request).responseData
            {
                response in switch response.result
                {
                case .success(let data):
                    let decoder = JSONDecoder()
                    do {
                        let wikiTextResponse = try decoder.decode(WikiTextResponse.self, from: data)
                        completion(wikiTextResponse)
                    } catch let error {
                        print("Parsing failed with error: \(error)")
                    }
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
        }
    }
}
