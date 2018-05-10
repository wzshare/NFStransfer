//
//  ViewController.swift
//  NFStransfer
//
//  Created by wangzhe on 2018/5/7.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

import UIKit
import CoreML

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
    @IBOutlet weak var imageDetail: UILabel!
    
    var inputImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let image = UIImage(named: "rowan") else {
            fatalError("no input image.")
        }
        scene.image = image
        inputImage = image
        imageDetail.text = "width: \(scene.frame.size.width) height: \(scene.frame.size.height)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetImage(_ sender: Any) {
        scene.image = inputImage
    }
    

}

extension ViewController {
    
    @IBAction func runCandyModel(_ sender: Any) {
        guard let pixelBuffer = inputImage?.pixelBuffer(width: 720, height: 720) else {
            return
        }
        
        let model = FNS_Candy()
        
        do {
            let ouput = try model.prediction(inputImage: pixelBuffer)
            NSLog("candy style success")
            scene.image = UIImage(pixelBuffer: ouput.outputImage)
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
            scene.image = UIImage(pixelBuffer: ouput.outputImage)
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
            scene.image = UIImage(pixelBuffer: ouput.outputImage)
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
            scene.image = UIImage(pixelBuffer: ouput.outputImage)
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
            scene.image = UIImage(pixelBuffer: ouput.outputImage)
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
            scene.image = UIImage(pixelBuffer: ouput.outputImage)
        } catch {
            NSLog("mosaic style fail")
        }
    }
    
}

