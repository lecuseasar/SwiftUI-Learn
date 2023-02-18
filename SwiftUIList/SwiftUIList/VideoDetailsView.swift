//
//  VideoDetailsVide.swift
//  SwiftUIList
//
//  Created by emre argana on 22.01.2023.
//

import SwiftUI

struct VideoDetailsView: View {
    var video: Video
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Image(video.imageName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding()
                Text(video.title)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                HStack (){
                    Label("\(video.viewCount)", systemImage: "eye")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(video.uploadDate)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 30)
                Text(video.description)
                    .font(.body)
                    .padding()
                
                Link(destination: video.url) {
                    Text("Watch Now")
                        .bold()
                        .font(.title2)
                        .frame(width: 280, height: 50)
                        .background(Color(.systemRed))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
            }
        }
    }
}

struct VideoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailsView(video: VideoList.topTen.last!)
    }
}
