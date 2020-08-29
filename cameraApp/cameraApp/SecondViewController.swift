//
//  SecondViewController.swift
//  cameraApp
//
//  Created by 福島大稀 on 2020/08/29.
//  Copyright © 2020 Maresuke. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var CompleteImage: UIImageView!
    
    var completeImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        CompleteImage.image = completeImage
    }
    
    @IBAction func trushBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        
        UIImageWriteToSavedPhotosAlbum(completeImage!, nil, nil, nil)
        self.dismiss(animated: true, completion: nil)
    }
}
