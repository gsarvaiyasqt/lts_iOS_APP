//
//  CustomVideoPlayer .swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 30/10/24.
//

import SwiftUI

struct CustomVideoPlayer_: View {
    var body: some View {
        if let url = URL(string: "https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_1mb.mp4") {
                  VideoPlayerView(videoURL: url)
              } else {
                  Text("Invalid video URL")
              }
    }
}

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let videoURL: URL

    var body: some View {
        VideoPlayer(player: AVPlayer(url: videoURL))
            .frame(height: UIScreen.main.bounds.height / 4)
            .aspectRatio(1.65,contentMode: .fit)
            .onAppear {
                // Optional: Auto-play the video when the view appears
                AVPlayer(url: videoURL).play()
            }
            
        
    }
}




#Preview {
    CustomVideoPlayer_()
}
