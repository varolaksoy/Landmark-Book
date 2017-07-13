//
//  ImageViewController.swift
//  Landmark Book
//
//  Created by Mac on 14.07.2017.
//  Copyright © 2017 Varol. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // ben bunları burada tanımladım ama değerleri öteki taraftan atadım hep. 
    var landmarkName = ""
    var landmarkImage = UIImage()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = landmarkImage
        
        nameLabel.text = landmarkName
        
        
    }

    

}
