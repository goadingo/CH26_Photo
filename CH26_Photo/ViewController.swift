//
//  ViewController.swift
//  CH26_Photo
//
//  Created by adin on 2020/2/5.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageViews: [UIImageView]!
    
    
    var urlStrings = [
        //vegetable (bottom)
        "https://cdn1.sph.harvard.edu/wp-content/uploads/sites/21/2018/07/fruitveg-454x313.jpeg",
        
        //portrait (left)
        "https://drscdn.500px.org/photo/88195029/m%3D900/v2?sig=727ce32f415cfbee114e39912e6513685783723e9c7c91e5bfe2110891c12a83",
        //camel (right)
        "https://static.boredpanda.com/blog/wp-content/uploads/2020/01/solar-eclipse-dubai-desert-joshua-cripps-fb-png__700.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for(i, imageView) in imageViews.enumerated() {
            
            let urlString = urlStrings[i]
            
            if let url = URL(string: urlString){
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let data = data {
                        DispatchQueue.main.async {
                            imageView.image = UIImage(data: data)
                        }
                    }
                }.resume()
            }
        }
    }
}

