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
    
    @IBOutlet weak var collectionView: GeminiCollectionView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            
            collectionView.dataSource = self
            collectionView.delegate = self
            
        
            let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
//            flow.scrollDirection = .horizontal
        
            // Cube animation
            collectionView.gemini
                .cubeAnimation()
                .cubeDegree(90)
        
            // yaw animation
//            collectionView.gemini.yawRotationAnimation().degree(45)
        
//            collectionView.gemini.pitchRotationAnimation().degree(90)
            
//              collectionView.gemini.rollRotationAnimation().degree(90).rollEffect(.rollUp)
        
            // circle animation
//            collectionView.gemini
//            .circleRotationAnimation()
//            .radius(450) // The radius of the circle
//            .rotateDirection(.clockwise) // Direction of rotation.
//            .itemRotationEnabled(true) // Whether the item rotates or not.
        
            // Custom Rotarion
//            collectionView.gemini
//            .customAnimation()
//                .translation(x: 80, y: 0, z: 0)
//                .rotationAngle(x: 0, y: 0, z: 0)
//            .ease(.easeOutExpo)
//            .shadowEffect(.fadeIn)
//            .maxShadowAlpha(0.3)
        
            // Scale Animation
            collectionView.gemini
            .scaleAnimation()
            .scale(0.7)
            .scaleEffect(.scaleUp) // or .scaleDown
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return array.count
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


