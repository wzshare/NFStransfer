//
//  ViewController.swift
//  NFStransfer
//
//  Created by wangzhe on 2018/5/7.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scene: UIImageView!
    @IBOutlet weak var imageDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let image = UIImage(named: "bruno") else {
            fatalError("no input image.")
        }
        scene.image = image
        imageDetail.text = "width:\(scene.frame.size.width) height:\(scene.frame.size.height)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

