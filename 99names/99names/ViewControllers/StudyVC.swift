//
//  StudyVC.swift
//  99names
//
//  Created by Helal Chowdhury on 4/18/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import UIKit
import Gemini

class StudyVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let photos = ["sky", "sky", "sky", "sky", "sky"]
    @IBOutlet weak var collectionView: GeminiCollectionView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            
            collectionView.dataSource = self
            collectionView.delegate = self
            
            // Configure the animation
            collectionView.gemini
                .cubeAnimation()
                .cubeDegree(90)
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return photos.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gemCell", for: indexPath) as! quizCell
            
            let arabicName = array[0].data[indexPath.row].name
            let englishName = array[0].data[indexPath.row].transliteration
            let meaningName = array[0].data[indexPath.row].en.meaning
            
            cell.setData(arabic: arabicName, name: englishName, meaning: meaningName)
            
            // Animate
            self.collectionView.animateCell(cell)
            
            return cell
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            
            // Animate
            self.collectionView.animateVisibleCells()
        }
        
        func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            
            // Animate
            if let cell = cell as? quizCell {
                self.collectionView.animateCell(cell)
            }
            
        }

    }


