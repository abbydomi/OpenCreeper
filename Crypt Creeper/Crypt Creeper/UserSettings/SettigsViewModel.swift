//
//  SettigsViewModel.swift
//  Crypt Creeper
//
//  Created by Osasu sanchez on 13/2/23.
//

import Foundation
import UIKit

struct user : Codable {
    let name : String
    var password : String
    var email : String
    var faction_id : Int
    var profile_pic : String
}
enum NetworkError: Error {
    case invalidUrl
    case invalidResponse
    case invalidData
    case requestFailed
    case authenticationError
    case badRequest
    case outdated
    case failed
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .invalidUrl:
            return "The URL is not valid"
        case .invalidResponse:
            return "The response received from the server is not valid"
        case .invalidData:
            return "The data received from the server is not valid"
        case .requestFailed:
            return "The request failed"
        case .authenticationError:
            return "There was an authentication error"
        case .badRequest:
            return "The request is not valid"
        case .outdated:
            return "The request is outdated"
        case .failed:
            return "The request failed for an unknown reason"
        case .unknown:
            return "An unknown error occurred"
        }
    }
}



class SettingsViewModel : ObservableObject {
    
    @Published var userName = ""
    @Published var pass = ""
    @Published var newPass = ""
    @Published var repitNewPass = ""
    @Published var email = ""
    @Published var showAlet1 = false
    @Published var showCN = false
    @Published var showCP = false
    @Published var showCPic = false
    @Published var showLog = false
    @Published var showLogOut = false
    @Published var showDestry = false
    
    @Published var profile_pic : UIImage?
    @Published var message = ""
    //b @Published var data : [user] = []
    
    
    
    func ChangeName(completion: @escaping (Result<String, Error>) -> Void) {
       
        let url =  "http://127.0.0.1:8000/api/user/change-name"

        let parametros : [String:Any] = ["name": userName]
        
        NetworkHelper.shared.requestProvider(url: url, type:.POST, params: parametros) { data, response, error in
            
            // Verificar si hay un error
            if let error = error {
                completion(.failure(error))
                return
            }
            // Verificar si se recibió una respuesta válida
            guard let data = data, let httpResponse = response as? HTTPURLResponse, (200..<599).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            // Procesar la respuesta
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let responseJson = json as? [String: Any], let message = responseJson["message"] as? String {
                    completion(.success(message))
                } else {
                    completion(.failure(NetworkError.invalidData))
                }
            } catch {
                completion(.failure(NetworkError.invalidData))
            }
        }
    }
    func changePassword(completion: @escaping (Result<String, Error>) -> Void)  {
        
        
        let url =  "http://127.0.0.1:8000/api/user/change-password"
        let parametros : [String:Any] = [
            "password": pass,
            "new_password" : newPass,
            "repit_new_password" : repitNewPass]
        
        NetworkHelper.shared.requestProvider(url: url, type:.POST , params: parametros) { data, response, error in
            // Verificar si hay un error
            if let error = error {
                completion(.failure(error))
                return
            }
            // Verificar si se recibió una respuesta válida
            guard let data = data, let httpResponse = response as? HTTPURLResponse, (200..<599).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            // Procesar la respuesta
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let responseJson = json as? [String: Any], let message = responseJson["message"] as? String {
                    completion(.success(message))
                } else {
                    completion(.failure(NetworkError.invalidData))
                }
            } catch {
                completion(.failure(NetworkError.invalidData))
            }
        }
    }
    
    func changePhoto(completion: @escaping (Result<String, Error>) -> Void){
        
      
        let  url =  "http://127.0.0.1:8000/api/user/change-photo"
       
        let parametros : [String: Any] = [
            "profile_pic": Base64.shared.convertImageToBase64(image: profile_pic ?? UIImage())]
        
        NetworkHelper.shared.requestProvider(url: url, type:.POST , params: parametros) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            // Verificar si se recibió una respuesta válida
            guard let data = data, let httpResponse = response as? HTTPURLResponse, (200..<599).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            // Procesar la respuesta
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let responseJson = json as? [String: Any], let message = responseJson["message"] as? String {
                    completion(.success(message))
                } else {
                    completion(.failure(NetworkError.invalidData))
                }
            } catch {
                completion(.failure(NetworkError.invalidData))
            }
        }
    }
    
    
    func logOut(completion:@escaping (Result<String, Error>) -> Void){
        
       
        
        let  url =  "http://127.0.0.1:8000/api/user/logout"
        // Verificar si se recibió una respuesta válida
        NetworkHelper.shared.requestProvider(url: url) { data, response, error in
            guard let data = data, let httpResponse = response as? HTTPURLResponse, (200..<599).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
    
            // Procesar la respuesta
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let responseJson = json as? [String: Any], let message = responseJson["message"] as? String {
                    completion(.success(message))
                } else {
                    completion(.failure(NetworkError.invalidData))
                }
            } catch {
                completion(.failure(NetworkError.invalidData))
            }
        }
        
    }
    func destryAccount(completion: @escaping (Result<String, Error>) -> Void) {
       
        let url =  "http://127.0.0.1:8000/api/user/delete-user"

        let parametros : [String:Any] = ["password": pass]
        
        NetworkHelper.shared.requestProvider(url: url, type:.DELETE, params: parametros) { data, response, error in
            
            // Verificar si hay un error
            if let error = error {
                completion(.failure(error))
                return
            }
            // Verificar si se recibió una respuesta válida
            guard let data = data, let httpResponse = response as? HTTPURLResponse, (200..<599).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            // Procesar la respuesta
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let responseJson = json as? [String: Any], let message = responseJson["message"] as? String {
                    completion(.success(message))
                } else {
                    completion(.failure(NetworkError.invalidData))
                }
            } catch {
                completion(.failure(NetworkError.invalidData))
            }
        }
    }

    
}


