//
//  SecondVC.swift
//  CustomUICollectionPart2
//
//  Created by Mohamed on 8/23/19.
//  Copyright © 2019 Mohamed74. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var imageName:String!
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let name = imageName else {return}
        
        if let imageName = UIImage(named: name){
            
            imageView.image = imageName
        }
        
    }

}
