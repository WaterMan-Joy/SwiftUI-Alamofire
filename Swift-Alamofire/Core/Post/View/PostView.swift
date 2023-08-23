//
//  PostView.swift
//  Swift-Alamofire
//
//  Created by 김종희 on 2023/08/23.
//

import SwiftUI

struct PostView: View {
    
    @ObservedObject var viewModel = AlamofireViewModel()

    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.photos) { photo in
                    Text(photo.description)
                    Divider()
                }
            }
            .padding()
        }
        .refreshable {
            viewModel.fetchPhotos()
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
