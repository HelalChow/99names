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
    
    
    
    var estimateWidth = 300.0
    let cellMarginSize = 30.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.collectView.delegate = self
        self.collectView.dataSource = self
//
        self.collectView.register(UINib(nibName: "itemCell", bundle: nil), forCellWithReuseIdentifier: "itemCell")
        setupGridView()
        

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setupGridView()
        DispatchQueue.main.async {
            self.collectView.reloadData()
        }
    }
    
    func setupGridView(){
        let flow = collectView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
        flow.scrollDirection = .vertical
    }

}
extension CarouselVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! itemCell

        let arabicName = array[0].data[indexPath.row].name
        let englishName = array[0].data[indexPath.row].transliteration
        let meaningName = array[0].data[indexPath.row].en.meaning
        
        cell.setData(arabic: arabicName, name: englishName, meaning: meaningName)
        return cell
    }
}

extension CarouselVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWith()
//        return CGSize(width: width, height: width)
        return CGSize(width: collectionView.frame.width/1.1, height: collectionView.frame.width/0.9)
    }
    func calculateWith() -> CGFloat {
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))

        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount

        return width
    }
    
    
}
