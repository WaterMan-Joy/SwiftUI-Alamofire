//
//  AlamofireViewModel.swift
//  Swift-Alamofire
//
//  Created by 김종희 on 2023/08/22.
//

import Foundation
import Alamofire


class AlamofireViewModel: ObservableObject {
    
    @Published var photos = [Photo]()
    
    init() {
        fetchPhotos()
    }
    
    func fetchPhotos() {
        let url = "https://jsonplaceholder.typicode.com/posts"
        AF.request(
            url,
            method: .get,
            encoding: JSONEncoding.default)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: AFDataResponse<Photo>.self) { response in
                switch response.result {
                    // [CASE] API 통신에 성공한 경우
                case .success(let value):
                    print("성공하였습니다 :: \\(value)")
                    // [CASE] API 통신에 실패한 경우
                case .failure(let error):
                    
                    print("실패하였습니다 :: \\(error)" )
                }
            }
    }
    
//    func fetchPhotos() {
//        print("DEBUG: FETCH PHOTOS")
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
//        print(url)
//        let task = URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data, error == nil else {return}
//            print(data)
//
//            do {
//                let photos = try JSONDecoder().decode([Photo].self, from: data)
//                print(photos)
//                DispatchQueue.main.async {
//                    print(photos.count)
//                    self.photos = photos
//                }
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//        task.resume()
//    }
}
