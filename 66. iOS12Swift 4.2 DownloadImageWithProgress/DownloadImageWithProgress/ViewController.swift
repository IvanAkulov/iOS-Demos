//
//  ViewController.swift
//  DownloadImageWithProgress
//
//  Created by Alexey Efimov on 05/11/2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    private let largeImageUrl = "https://i.imgur.com/3416rvI.jpg"

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var completedLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        completedLabel.isHidden = true
        progressView.isHidden = true
        
        fetchImage(fromUrl: largeImageUrl)
    }

    private func fetchImage(fromUrl url: String) {
        
        guard let url = URL(string: url) else { return }
        
        completedLabel.isHidden = false
        progressView.isHidden = false
        
        request(url)
            .validate()
            .downloadProgress { (progress) in
                
                print("totalUnitCount: \(progress.totalUnitCount)\n")
                print("completedUnitCount:\(progress.completedUnitCount)\n")
                print("fractionCompleted:\(progress.fractionCompleted)\n")
                print("loclizedDescription:\(progress.localizedDescription!)\n")
                print("---------------------------------------------------------")
                
                self.progressView.setProgress(Float(progress.fractionCompleted), animated: true)
                self.completedLabel.text = progress.localizedDescription
                
            }.response { (response) in
                
                guard let data = response.data, let image = UIImage(data: data) else { return }
                
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.completedLabel.isHidden = true
                    self.progressView.isHidden = true
                    self.imageView.image = image
                }
        }
    }

}

