//
//  UserCell.swift
//  Swift-Alamofire
//
//  Created by 김종희 on 2023/08/23.
//

import SwiftUI

struct UserCell: View {
    
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("이름: \(user.username)")
                Text("이메일: \(user.email)")
                Text("주소: \(user.address.city), \(user.address.zipcode), \(user.address.geo.lat), \(user.address.geo.lng)")
                Text("번호: \(user.phone)")
                Text("웹사이트: \(user.website)")
                Text("회사이름: \(user.company.name)")
                
            }
            Spacer()
        }
        .padding()
    }
}

//struct UserCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCell()
//    }
//}
