//
//  HomeViewController.swift
//  SHApp
//
//  Created by Stefan Hitrov on 16.10.20.
//

import UIKit
import youtube_ios_player_helper

class HomeViewController: UIViewController, YTPlayerViewDelegate{

    @IBOutlet var playerView: YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.delegate = self
        playerView.load(withVideoId: "ZcS3Fdxh6hU", playerVars: ["playsinline": 1])
    }
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
//        playerView.playVideo()
    }
}
