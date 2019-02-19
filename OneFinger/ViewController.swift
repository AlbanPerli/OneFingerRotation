//
//  ViewController.swift
//  OneFinger
//
//  Created by AL on 19/02/2019.
//  Copyright © 2019 AL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gesture:OneFingerRotationGestureRecognizer?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gesture = OneFingerRotationGestureRecognizer(target: self, action: #selector(rotating(recognizer:)))
        imageView.addGestureRecognizer(gesture!)
        
    }


    @objc func rotating(recognizer:OneFingerRotationGestureRecognizer) {
        print(recognizer.rotation)
        imageView.transform = imageView.transform.rotated(by: recognizer.rotation)
        //imageView.transform.rotated(by: recognizer.rotation)
    }
    
}

