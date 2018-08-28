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
    
    var cacheOfText = [String: WikiResponse]()

    func getRandomArticles(completion: @escaping (_ wikiRandomResponse : WikiResponse?) -> Void)
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
                        let wikiRandomResponse = try decoder.decode(WikiResponse.self, from: data)
                        completion(wikiRandomResponse)
                    } catch let error {
                        completion(nil)

                        print("Parsing failed with error: \(error)")
                    }
                case .failure(let error):
                    completion(nil)
                    print("Request failed with error: \(error)")
                }
        }
    }
    
    func getArticleContetnt(title: String, completion: @escaping (_ wikiTextResponse : WikiResponse?) -> Void)
    {
        if cacheOfText.keys.contains(title) {
            completion(cacheOfText[title])
        }
        else{
            let titleWithoutSpave = title.replacingOccurrences(of: " ", with: "%20")
            guard let url = URL(string: "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro=&explaintext=&titles=" + titleWithoutSpave) else {
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
                            let wikiTextResponse = try decoder.decode(WikiResponse.self, from: data)
                            self.cacheOfText[title] = wikiTextResponse
                            completion(wikiTextResponse)
                        } catch let error {
                            print("Parsing failed with error: \(error)")
                            completion(nil)
                        }
                    case .failure(let error):
                        print("Request failed with error: \(error)")
                        completion(nil)
                    }
            }
        }
        
    }
}
