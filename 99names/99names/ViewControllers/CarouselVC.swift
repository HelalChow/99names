//
//  CarouselVC.swift
//  99names
//
//  Created by Helal Chowdhury on 4/23/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import UIKit
import Gemini

class CarouselVC: UIViewController {


    @IBOutlet weak var collectView: GeminiCollectionView!
    
    
    
    var estimateWidth = 300.0
    let cellMarginSize = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.collectView.delegate = self
        self.collectView.dataSource = self

        self.collectView.register(UINib(nibName: "itemCell", bundle: nil), forCellWithReuseIdentifier: "itemCell")
        setupGridView()
        
        // Cube Animation
        collectView.gemini
        .cubeAnimation()
        .cubeDegree(90)
        
        // Circle Animation
//        collectView.gemini
//        .circleRotationAnimation()
//        .radius(450) // The radius of the circle
//        .rotateDirection(.clockwise) // Direction of rotation.
//        .itemRotationEnabled(true) // Whether the item rotates or not.
        
        // Custom Animation
//        collectView.gemini
//        .customAnimation()
//            .translation(x: 0, y: 50, z: 0)
//            .rotationAngle(x: 0, y: 13, z: 0)
//        .ease(.easeOutExpo)
//        .shadowEffect(.fadeIn)
//        .maxShadowAlpha(0.3)

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
        
        //Animate Cell
        collectView.animateCell(cell)
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Animate
        collectView.animateVisibleCells()
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? itemCell{
            collectView.animateCell(cell)        }
    }
    
}
