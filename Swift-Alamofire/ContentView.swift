//
//  ContentView.swift
//  Swift-Alamofire
//
//  Created by 김종희 on 2023/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = AlamofireViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                Button(action: {
                    viewModel.fetchPhotos()
                }, label: {
                    Text("go")
                })
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
