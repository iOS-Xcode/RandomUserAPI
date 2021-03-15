//
//  ContentView.swift
//  RandomUserAPI
//
//  Created by Seokhyun Kim on 2021-03-11.
//

import SwiftUI

struct ContentView: View {
    //randomUsers가 변경되면 ObservedObject의해 뷰를 다시 그림.
    @ObservedObject var randomUserViewModel = RandomUserViewModel()
    
    var body: some View {
        List(randomUserViewModel.randomUsers){ aRandomUser in
            RandomUserRowView(aRandomUser)
        }
//        List(0...100, id: \.self) { index in
//            RandomUserRowView()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
