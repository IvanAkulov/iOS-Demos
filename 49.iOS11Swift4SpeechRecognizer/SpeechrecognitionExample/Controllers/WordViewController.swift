//
//  WordViewController.swift
//  SpeechrecognitionExample
//
//  Created by Kostya Golenkov on 18.11.17.
//  Copyright © 2017 Kostya Golenkov. All rights reserved.
//

import UIKit
import AVFoundation
import Speech

class WordViewController: UIViewController {
    var word = ("","")
    
    var player:AVAudioPlayer?
    
    let audioEngine = AVAudioEngine()
    let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en_US"))
    let request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    
    @IBOutlet weak var transcriptionLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var recognizeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordLabel.text = word.0
        transcriptionLabel.text = word.1
        
        //configure player
        guard let url = Bundle.main.url(forResource: word.0, withExtension: "mp3") else { return }
        player = try? AVAudioPlayer(contentsOf: url)
        
        //configure speech recogniton
        SFSpeechRecognizer.requestAuthorization {[unowned self] (status) in
            switch status {
            case .authorized:
                DispatchQueue.main.async {
                    [unowned self] in
                    self.recognizeButton.isEnabled = true
                }
            case .denied:
                print("statu denied")
            case .notDetermined:
                print("statu not determined")
            case .restricted:
                print("statu restricted")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playWordAction(_ sender: Any) {
        player?.play()
    }
    
    @IBAction func recognizeSpeechAction(_ sender: UIButton) {
        if sender.isSelected {
            audioEngine.stop()
            request.endAudio()
            recognitionTask?.cancel()
        } else {
            startRecognition()
        }
        
        sender.isSelected = !sender.isSelected
    }
    
    fileprivate func startRecognition () {
        let node = audioEngine.inputNode
        let recognitionFormat = node.outputFormat(forBus: 0)
        
        node.installTap(onBus: 0, bufferSize: 1024, format: recognitionFormat) {
            [unowned self](buffer, audioTime) in
            self.request.append(buffer)
        }
        
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch let error {
            print("\(error.localizedDescription)")
            return
        }
        
        recognitionTask = speechRecognizer?.recognitionTask(with: request, resultHandler: {
            [unowned self] (result, error) in
            if let res = result?.bestTranscription {
                DispatchQueue.main.async { [unowned self] in
                    self.resultLabel.text = res.formattedString;
                }
            } else if let error = error {
                print("\(error.localizedDescription)")
            }
        })
    }
}
