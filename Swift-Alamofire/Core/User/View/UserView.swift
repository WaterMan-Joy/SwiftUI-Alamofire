//
//  UserView.swift
//  Swift-Alamofire
//
//  Created by 김종희 on 2023/08/23.
//

import SwiftUI

struct UserView: View {
    
    @ObservedObject var viewModel = UserViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.users) { user in
                Text(user.email)
            }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
