//
//  ViewController.swift
//  w6-practice
//
//  Created by Default User on 2/14/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audio: AVAudioPlayer?
    var imgLayer: CALayer?
    @IBOutlet var sliderUIElement: UISlider!
    
    @IBAction func playSong() {
        let soundUrl = Bundle.main.path(forResource: "sya", ofType: "mp3")
        let url = URL(fileURLWithPath: soundUrl!)
        audio = try! AVAudioPlayer.init(contentsOf: url)
        audio?.volume = sliderUIElement.value
        audio?.numberOfLoops = -1
        audio?.play()
    }
    
    @IBAction func stopSong() {
        audio?.stop();
    }
    
    @IBAction func updateVolumn() {
        audio?.volume = sliderUIElement.value
    }
    
    @IBAction func showImg() {
        var img = UIImage(named: "btn.png")
        imgLayer = .init()
        imgLayer?.contents = img?.cgImage
        imgLayer?.bounds = CGRect(x: 0, y: 0, width: 150, height: 150)
        imgLayer?.position = CGPoint(x: 200, y: 700)
        view.layer.addSublayer(imgLayer!)
    }
    
    @IBAction func rotate() {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)

        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = 2 * Double.pi

        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = 1.0
        rotateAnimation.repeatCount = .infinity

        imgLayer?.add(rotateAnimation, forKey: "rotate")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

