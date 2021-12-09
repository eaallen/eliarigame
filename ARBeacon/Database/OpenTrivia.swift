//
//  API.swift
//  CodeSensei
//
//  Created by Gove Allen on 9/28/21.
//

import Foundation


/*==========================================================
 API has our conenction to OpenTrivaDB. API has some public
 Structs that are used for marchelling our data out of
 JSON and into swift readable data
 =========================================================*/

struct OpenTrivia {
    struct Data: Codable{
        var results: Array<Question>
    }

    struct Question: Codable{
        var category:String
        var type:String
        var difficulty:String
        var question: String
        var correct_answer:String
        var incorrect_answers:Array<String>
    }
    
    struct OpenTriviaURL {
        static let quizCount = 1
        static let random = "https://opentdb.com/api.php?encode=base64"
        static let book = "https://opentdb.com/api.php?category=10&encode=base64"
        static let computer = "https://opentdb.com/api.php?category=18&encode=base64"
        static let art = "https://opentdb.com/api.php?category=25&encode=base64"
        
        static func HTTPRequest(_ url:String)->String{
            return "\(url)&amount=\(quizCount)"
        }
    }

    static func callWeb(url getRequest: String,callback: @escaping (Data?)->Void ){
        guard let url = URL(string: getRequest)else{ return    }

        var result: Data?

        URLSession.shared.dataTask(with: url) {(data,_,_) in
            // if we have an error, result will be nil
            result = try? JSONDecoder().decode(Data.self, from: data!)
            
            // base 64 decode
            let decoded = Data(results: result?.results.map{ q in
                return Question(category: q.category.base64Decoded(), type: q.type.base64Decoded(), difficulty: q.difficulty.base64Decoded(), question: q.question.base64Decoded(), correct_answer: q.correct_answer.base64Decoded(), incorrect_answers: q.incorrect_answers.map{ia in ia.base64Decoded()})
            } ?? [])
            
            
            DispatchQueue.main.async {
                // TODO: - handle empty deoceded array
                callback(decoded)
            }
            
        }.resume()
    }
}

