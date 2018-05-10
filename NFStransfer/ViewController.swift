//
//  ViewController.swift
//  NFStransfer
//
//  Created by wangzhe on 2018/5/7.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

import UIKit
import CoreML
import Photos

enum ModelStyle {
    case LaMuse
    case Mosaic
    case Udnie
    case Feathers
    case Scream
    case Candy
}

class ViewController: UIViewController {

    @IBOutlet weak var scene: UIImageView!
    
    var inputImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let image = UIImage(named: "daria") else {
            fatalError("no input image.")
        }
        scene.image = image
        inputImage = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetImage(_ sender: Any) {
        scene.image = inputImage
    }
    
    @IBAction func saveImage(_ sender: Any) {
        let image = scene.image!
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAsset(from: image)
        }) { (isSuccess: Bool, error: Error?) in
            if isSuccess {
                NSLog("save success")
                let alert = UIAlertController(title: "", message: "save success", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else{
                NSLog("save fail")
                let alert = UIAlertController(title: "", message: "save fail", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func cameraAction(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePickerController.sourceType = .camera
        }
        imagePickerController.delegate = self
//        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func albumAction(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            imagePickerController.sourceType = .savedPhotosAlbum
        }
        imagePickerController.delegate = self
//        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true, completion: nil)
    }
}

extension ViewController {
    
    func resizeImage(image: UIImage, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let reImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return reImage!
    }
    
    @IBAction func runCandyModel(_ sender: Any) {
        guard let pixelBuffer = inputImage?.pixelBuffer(width: 720, height: 720) else {
            return
        }
        
        let model = FNS_Candy()
        
        do {
            let ouput = try model.prediction(inputImage: pixelBuffer)
            NSLog("candy style success")
            let img = UIImage(pixelBuffer: ouput.outputImage)
            scene.image = resizeImage(image: img!, size: inputImage.size)
        } catch {
            NSLog("candy style fail")
        }
    }
    
    @IBAction func runFeathersModel(_ sender: Any) {
        guard let pixelBuffer = inputImage?.pixelBuffer(width: 720, height: 720) else {
            return
        }
        
        let model = FNS_Feathers()
        
        do {
            let ouput = try model.prediction(inputImage: pixelBuffer)
            NSLog("feathers style success")
            let img = UIImage(pixelBuffer: ouput.outputImage)
            scene.image = resizeImage(image: img!, size: inputImage.size)
        } catch {
            NSLog("feathers style fail")
        }
    }
    
    @IBAction func runScreamModel(_ sender: Any) {
        guard let pixelBuffer = inputImage?.pixelBuffer(width: 720, height: 720) else {
            return
        }
        
        let model = FNS_The_Scream()
        
        do {
            let ouput = try model.prediction(inputImage: pixelBuffer)
            NSLog("scream style success")
            let img = UIImage(pixelBuffer: ouput.outputImage)
            scene.image = resizeImage(image: img!, size: inputImage.size)
        } catch {
            NSLog("scream style fail")
        }
    }
    
    @IBAction func runLaMuseModel(_ sender: Any) {
        guard let pixelBuffer = inputImage?.pixelBuffer(width: 720, height: 720) else {
            return
        }
        
        let model = FNS_La_Muse()
        
        do {
            let ouput = try model.prediction(inputImage: pixelBuffer)
            NSLog("la muse style success")
            let img = UIImage(pixelBuffer: ouput.outputImage)
            scene.image = resizeImage(image: img!, size: inputImage.size)
        } catch {
            NSLog("la muse style fail")
        }
    }
    
    @IBAction func runUdnieModel(_ sender: Any) {
        guard let pixelBuffer = inputImage?.pixelBuffer(width: 720, height: 720) else {
            return
        }
        
        let model = FNS_Udnie()
        
        do {
            let ouput = try model.prediction(inputImage: pixelBuffer)
            NSLog("udnie style success")
            let img = UIImage(pixelBuffer: ouput.outputImage)
            scene.image = resizeImage(image: img!, size: inputImage.size)
        } catch {
            NSLog("udnie style fail")
        }
    }
    
    @IBAction func runMosaicModel(_ sender: Any) {
        guard let pixelBuffer = inputImage?.pixelBuffer(width: 720, height: 720) else {
            return
        }
        
        let model = FNS_Mosaic()
        
        do {
            let ouput = try model.prediction(inputImage: pixelBuffer)
            NSLog("mosaic style success")
            let img = UIImage(pixelBuffer: ouput.outputImage)
            scene.image = resizeImage(image: img!, size: inputImage.size)
        } catch {
            NSLog("mosaic style fail")
        }
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerOriginalImage] else {
            return
        }
        scene.image = image as? UIImage
        inputImage = image as! UIImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

