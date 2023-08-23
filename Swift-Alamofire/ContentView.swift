//
//  ContentView.swift
//  Swift-Alamofire
//
//  Created by 김종희 on 2023/08/22.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        TabView {
            Group {
                PostView()
                    .tabItem {
                        Image(systemName: "house.circle")
                                                Text("Posts")
                    }
                UserView()
                    .tabItem {
                        Image(systemName: "house.circle")
                                                Text("Users")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
