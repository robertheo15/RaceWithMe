//
//  HomeView.swift
//  RaceWithMe
//
//  Created by Johan Sianipar on 02/05/24.
//

import SwiftUI
import AVKit

struct AVPlayerControllerRepresented : UIViewControllerRepresentable {
    var player : AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}

func createLocalUrl(for filename: String, ofType: String) -> URL? {
        let fileManager = FileManager.default
        let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let url = cacheDirectory.appendingPathComponent("\(filename).\(ofType)")
        
        guard fileManager.fileExists(atPath: url.path) else {
            guard let video = NSDataAsset(name: filename)  else { return nil }
            fileManager.createFile(atPath: url.path, contents: video.data, attributes: nil)
            return url
        }
        
        return url
    }

struct HomeScreenView: View {
//    let videoURL = createLocalUrl(for: "homeScreen", ofType: "mp4")!
//    @State var path = Bundle.main.path(forResource: "homeScreen", ofType: "mp4")
//    var player =  AVPlayer(url: NSURL(fileURLWithPath: path!) as URL)
    let avPlayer = AVPlayer(url:  Bundle.main.url(forResource: "homeScreen", withExtension: "mp4")!)
    let carEngine = AVPlayer(url:  Bundle.main.url(forResource: "sound_car_engine1", withExtension: "mp3")!)
    let clickSound = AVPlayer(url:  Bundle.main.url(forResource: "sound_button_click1", withExtension: "mp3")!)
    
    var body: some View {
        NavigationView {
            VStack{
                ZStack{
                    VideoPlayer(player: avPlayer)
                        .ignoresSafeArea()
                        .onAppear(perform: {
                            avPlayer.play()
                        })
                                .scaledToFill()
                                .allowsHitTesting(false)
                    VStack{
                        Spacer()
                        NavigationLink {
                            ContentView()
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            Text("Start Game")
                                .bold()
                                .font(.title)
                                .foregroundStyle(Color.orange)
                                .frame(maxWidth: 250, maxHeight: 56)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .fill(.white)
                                .opacity(0.9)
                                .padding(.horizontal)
                        ).padding(.bottom, 120)
                            .simultaneousGesture(TapGesture().onEnded {
                                clickSound.volume = 4
                                clickSound.play() // <-- for testing
                                            // SoundManager.instance.playSound(sound: .impact)
                                        })
                    }

                }
            }
        }.onAppear(perform: {
            carEngine.play()
        })
    }
}

#Preview {
    HomeScreenView()
}
