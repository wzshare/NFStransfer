//
//  ViewController.swift
//  NFStransfer
//
//  Created by wangzhe on 2018/5/7.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

import UIKit
import CoreML

class ViewController: UIViewController {

    @IBOutlet weak var scene: UIImageView!
    @IBOutlet weak var imageDetail: UILabel!
    
    var inputImage: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let image = UIImage(named: "daria") else {
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
        
        let model = FNS_Candy_1()
        
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
        
        let model = FNS_Feathers_1()
        
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
        
        let model = FNS_The_Scream_1()
        
        do {
            let ouput = try model.prediction(inputImage: pixelBuffer)
            NSLog("scream style success")
            scene.image = UIImage(pixelBuffer: ouput.outputImage)
        } catch {
            NSLog("scream style fail")
        }
    }
}

