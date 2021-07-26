//
//  PlayerController.swift
//  Music Search 2
//
//  Created by Narek Arsenyan on 07.07.21.
//  Copyright © 2021 Narek Arsenyan. All rights reserved.
//

import UIKit
import AVKit
import SafariServices

class PlayerController: UIViewController {
    
    
    var player: AVPlayer?
    var playerItem: AVPlayerItem?

    @IBOutlet weak var forward: UIButton!
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var rewind: UIButton!
    @IBOutlet weak var nextTrack: UIButton!
    @IBOutlet weak var prevTrack: UIButton!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var trackSlider: UISlider!
    @IBOutlet weak var buyNow: UIButton!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var artistName_songName: UILabel!
    @IBOutlet weak var albumCover: UIImageView!
  
    var song: SongData?
    var isPlaying = false
    var songs: [SongData]!
    var songRow: Int!
    var observer: Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fixSlider()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func previous() {
        if songRow > 0 {
            songRow -= 1
            viewDidAppear(true)
            play.setImage(UIImage(named: "outline_play_circle_black_48pt"), for: .normal)
            isPlaying = false
        }
    }
    
    @IBAction func next() {
        if songRow + 1 < songs.count {
            songRow += 1
            viewDidAppear(true)
            play.setImage(UIImage(named: "outline_play_circle_black_48pt"), for: .normal)
            isPlaying = false
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        song = songs[songRow]
        install()
        initPlayer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        player!.pause()
        NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: nil)
        player!.removeTimeObserver(observer!)
        player = nil
        playerItem = nil
        super.viewWillDisappear(true)
    }
    
    
    
    @IBAction func playPause(_ sender: UIButton) {
        if isPlaying {
            player!.pause()
            play.setImage(UIImage(named: "outline_play_circle_black_48pt"), for: .normal)
        } else {
            player!.play()
            play.setImage(UIImage(named: "outline_pause_black_48pt"), for: .normal)
        }
        isPlaying = !isPlaying
    }
    
    func fixSlider() {
        trackSlider.frame = CGRect(x: 0, y: trackSlider.frame.origin.y, width: albumCover.bounds.width , height: trackSlider.frame.height)
    }

    func install() {
        artistName_songName.text = song!.artistName + " - " + song!.trackName
        albumName.text = song!.collectionName
        DispatchQueue.global(qos: .background).async {
            if let url = URL(string: self.song!.artworkUrl100) {
                do {
                    let data = try Data(contentsOf: url)
                    print(data)
                    DispatchQueue.main.async() { [weak self] in
                        self?.albumCover.image = UIImage(data: data)
                    }
                }
                catch {
                    print(error)
                }
            }
        }
    }
    
    @IBAction func trackSliderChanged(_ sender: UISlider) {
        print(sender.value)
        self.player!.seek(to: CMTime(seconds: Double(sender.value), preferredTimescale: 1))
    }
    
    
    @IBAction func rewindAction() {
        let currentTimePlayer = player!.currentTime().seconds
        var finalTime = 0.0
        if currentTimePlayer > 5 {
            finalTime = currentTimePlayer - 5.0
        }
        self.player!.seek(to: CMTime(seconds: finalTime, preferredTimescale: 1))
    }
    
    
    @IBAction func buyAction() {
        let url = URL(string: song!.trackViewUrl)
        let vc = SFSafariViewController(url: url!)
        present(vc, animated: true)
    }
    
    @IBAction func forwardAction() {
        let currentTimePlayer = player!.currentTime().seconds
        self.player!.seek(to: CMTime(seconds: currentTimePlayer + 5.0, preferredTimescale: 1))
    }
    
    func initPlayer() {
        trackSlider.isContinuous = true
        
        self.playerItem = AVPlayerItem(url: URL(string: song!.previewUrl)!)
        self.player = AVPlayer(playerItem: playerItem)
        trackSlider.minimumValue = 0
        trackSlider.value = 0

        
        let duration : CMTime = playerItem!.asset.duration
        let second : Double = CMTimeGetSeconds(duration)
        trackSlider.maximumValue = Float(second)
        currentTime.text = "00:00"
        endTime.text = stringFromTimeInterval(interval: second)
        
        observer = player!.addPeriodicTimeObserver(forInterval: CMTimeMakeWithSeconds(1, preferredTimescale: 1), queue: DispatchQueue.main) { (CMTime) -> Void in
            if self.player!.currentItem?.status == .readyToPlay {
                    let time : Float64 = CMTimeGetSeconds(self.player!.currentTime())
                    self.trackSlider.value = Float ( time )
                    self.currentTime.text = self.stringFromTimeInterval(interval: time)
                }
            }
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishplaying), name: .AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    @objc func playerDidFinishplaying()  {
        self.player!.seek(to: CMTime(seconds: 0, preferredTimescale: 1))
        play.setImage(UIImage(named: "outline_play_circle_black_48pt"), for: .normal)
        isPlaying = false
    }
    
    func stringFromTimeInterval(interval: TimeInterval) -> String {
        let interval = Int(interval)
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
