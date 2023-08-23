//
//  UserViewModel.swift
//  Swift-Alamofire
//
//  Created by 김종희 on 2023/08/23.
//

import Foundation
import Alamofire
import Combine

class UserViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    var subscription = Set<AnyCancellable>()
    
    init() {
        print("DEBUG: INIT USER VIEW MODEL")
        fetchUsers()
    }
    
    func fetchUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        
        AF.request(url)
            .publishDecodable(type: [User].self)
            .compactMap({ $0.value})
            
            .sink { completion in
                print("DEBUG: COMPLETION")
            } receiveValue: { receiveValue in
                print("DEBUG: \(receiveValue)")
                self.users = receiveValue
            }.store(in: &subscription)
    }
}
