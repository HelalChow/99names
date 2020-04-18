//
//  StudyVC.swift
//  99names
//
//  Created by Helal Chowdhury on 4/18/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import UIKit

class StudyVC: UIViewController {
    @IBOutlet weak var iCarouselView: iCarousel!
    
    
    var imageArr = [
        UIImage(named: "card"),
        UIImage(named: "orange"),
        UIImage(named: "card")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(array.count)
        carouselSetup()
       
    }
    
    func carouselSetup(){
        iCarouselView.type = .cylinder
        iCarouselView.contentMode = .scaleAspectFill
        iCarouselView.isPagingEnabled = true
    }
    
   
}
extension StudyVC: iCarouselDelegate, iCarouselDataSource{
    func numberOfItems(in carousel: iCarousel) -> Int {
        return imageArr.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var imageView: UIImageView!
        if view == nil{
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 250))
            imageView.contentMode = .scaleAspectFit
        } else {
            imageView = view as? UIImageView
        }
        imageView.image = imageArr[index]
        return imageView
    }
    
}
