//
//  CarouselVC.swift
//  99names
//
//  Created by Helal Chowdhury on 4/23/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import UIKit

class CarouselVC: UIViewController {


    @IBOutlet weak var collectView: UICollectionView!
    
    let dataArray = ["AAA", "BBB", "CCC", "DDD", "EEE", "FFF", "GGG"]
    
    var estimateWidth = 160.0
    let cellMarginSize = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        self.collectView.delegate = self
        self.collectView.dataSource = self
//
        self.collectView.register(UINib(nibName: "itemCell", bundle: nil), forCellWithReuseIdentifier: "itelCell")
    }
    

}
extension CarouselVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! itemCell
        cell.setData(text: self.dataArray[0])
        return cell
    }
}

extension CarouselVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWith()
        return CGSize(width: width, height: width)
    }
    func calculateWith() -> CGFloat {
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))

        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount

        return width
    }
}
