//
//  CarouselVC.swift
//  99names
//
//  Created by Helal Chowdhury on 4/23/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import UIKit

class CarouselVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let dataArray = ["AAA", "BBB", "CCC", "DDD", "EEE", "FFF", "GGG"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.register(UINib(nibName: "itemCell", bundle: nil), forCellWithReuseIdentifier: "itelCell")
    }
    

}
extension CarouselVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! itemCell
        cell.setData(text: self.dataArray[indexPath.row])
        return cell
    }
    
    
}
