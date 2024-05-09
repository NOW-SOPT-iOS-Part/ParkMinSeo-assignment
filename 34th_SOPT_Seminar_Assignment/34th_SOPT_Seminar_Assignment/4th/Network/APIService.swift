//
//  APIService.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 5/10/24.
//

import Foundation
import Moya

final class APIService<Provider : TargetType> : MoyaProvider<Provider> {

    func sendRequest<Model : Decodable>(target : Provider,
                                            instance : Model.Type,
                                            completion : @escaping(Result<Model, MoyaError>) -> () ){
        self.request(target) { result in
            switch result {
            case .success(let response):
                do {
                    let isValid = try self.validateStatusCode(with: response)
                    let decodedData = try JSONDecoder().decode(Model.self, from: response.data)
                    completion(.success(decodedData))
                } catch let error as MoyaError{
                    completion(.failure(error)) // status validating에서 발생한 에러가 빠집니다
                } catch {
                    completion(.failure(.underlying(error, response))) // 디코딩 에러는 여기로 빠집니다
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func validateStatusCode(with response: Response) throws -> Bool {
        switch response.statusCode {
        case 200..<300:
            return true
        case 400...500:
            throw MoyaError.statusCode(response)
        default:
            throw MoyaError.underlying(URLError(.networkConnectionLost), response)
        }
    }
}
