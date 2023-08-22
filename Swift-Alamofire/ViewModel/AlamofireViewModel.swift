//
//  AlamofireViewModel.swift
//  Swift-Alamofire
//
//  Created by 김종희 on 2023/08/22.
//

import Foundation
import Alamofire
import Combine


class AlamofireViewModel: ObservableObject {
    
    @Published var photos = [Photo]()
    
    var subscription = Set<AnyCancellable>()
    
    init() {
        print("DEBUG: INIT ALAMOFIRE VIEW MODEL")
        fetchPhotos()
    }
    
    
    func fetchPhotos() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        AF.request(url)
            .publishDecodable(type: [Photo].self)
            .compactMap({ $0.value })
            .sink { conpletion in
                print("DEBUG: COMPLETE")
            } receiveValue: { receiveValue in
                print("DEBUG: \(receiveValue.count)")
                self.photos = receiveValue
            }.store(in: &subscription)

    }
    
    
}
