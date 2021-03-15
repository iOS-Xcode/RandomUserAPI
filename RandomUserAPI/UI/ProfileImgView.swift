//
//  ProfileImgView.swift
//  RandomUserAPI
//
//  Created by Seokhyun Kim on 2021-03-11.
//

import Foundation
import SwiftUI
import URLImage

struct ProfileImgView: View {
    var imageUrl : URL
    var body: some View {
        URLImage(url: imageUrl,
                 content: { image in
                     image
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                 })
            .frame(width: 50, height: 60)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.init(#colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)),
                                     lineWidth: 2))
    }
}

struct ProfileImgView_Priviews: PreviewProvider {
    static var previews: some View {
        let url = URL(string: "https://randomuser.me/api/portraits/men/76.jpg")
        ProfileImgView(imageUrl: url!)
    }
}
