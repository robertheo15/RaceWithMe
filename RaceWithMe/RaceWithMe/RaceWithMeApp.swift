//
//  RaceWithMeApp.swift
//  RaceWithMe
//
//  Created by robert theo on 29/04/24.
//
import SwiftUI
import SceneKit
import AVKit

@main
struct RaceWithMeApp: App {
    let music = AVPlayer(url:  Bundle.main.url(forResource: "background_music1", withExtension: "mp3")!)
    
    var body: some Scene {
        WindowGroup {
            HomeScreenView().onAppear{
                music.play()
            }
//            ContentView()
            
        }
    }
}

