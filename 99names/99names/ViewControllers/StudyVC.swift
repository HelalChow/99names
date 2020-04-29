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
    
    var newArr = [second]()
    @IBOutlet weak var collectionView: GeminiCollectionView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
           
            var counter = 0
            for i in array{
                if let checked = UserDefaults.standard.getValueOfCheck(index: array[0].data[counter].transliteration), checked {
                    newArr.append(array[0].data[counter])
                }
                counter = counter + 1
            }
            
            
            collectionView.dataSource = self
            collectionView.delegate = self
            
            
            newArr.shuffle()
     
        
            // Scale Animation
            collectionView.gemini
            .scaleAnimation()
            .scale(0.7)
            .scaleEffect(.scaleUp) // or .scaleDown
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return newArr.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gemCell", for: indexPath) as! quizCell
            
//            let arabicName = array[0].data[indexPath.row].name
//            let englishName = array[0].data[indexPath.row].transliteration
//            let meaningName = array[0].data[indexPath.row].en.meaning
            
            let arabicName = newArr[indexPath.row].name
            let englishName = newArr[indexPath.row].transliteration
            let meaningName = newArr[indexPath.row].en.meaning

            
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


