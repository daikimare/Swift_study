//
//  ViewController.swift
//  cameraApp
//
//  Created by 福島大稀 on 2020/08/29.
//  Copyright © 2020 Maresuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var additionalText: UITextField!
    
    let makesImage = makeImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        additionalText.placeholder = "テキストを記入してください"
        additionalText.clearButtonMode = .always
        additionalText.delegate = self
    }

    @IBAction func additionalButton(_ sender: Any) {
        // インスタンスを生成
        let picker = UIImagePickerController()
        
        // リソースタイプの指定
        let sourceType: UIImagePickerController.SourceType = UIImagePickerController.SourceType.photoLibrary
        
        // 動作環境でソースタイプで指定したもの(カメラ)が使用できるか
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            picker.sourceType = sourceType
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    func additionalShouldReturn(_ additionalText:UITextField) -> Bool {
        additionalText.resignFirstResponder()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let nextScreen = storyboard?.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        nextScreen.modalPresentationStyle = .fullScreen
        let image = info[.originalImage]
        nextScreen.completeImage = makesImage.toComplete(image: image as! UIImage, text: additionalText.text ?? "")
        picker.dismiss(animated: true, completion: nil)
        self.present(nextScreen, animated: true, completion: nil)
    }
}
