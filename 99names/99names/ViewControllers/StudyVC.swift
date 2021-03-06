//
//  StudyVC.swift
//  99names
//
//  Created by Helal Chowdhury on 4/18/20.
//  Copyright © 2020 Helal. All rights reserved.
//



import UIKit
import Gemini
import Firebase

class StudyVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var newArr = [second]()
    @IBOutlet weak var collectionView: GeminiCollectionView!
    
    @IBOutlet weak var totalAddedLabel: UILabel!
    let review = reviewService.shared
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
            var counter = 0
            for i in array{
                if let checked = UserDefaults.standard.getValueOfCheck(index: array[0].data[counter].transliteration), checked {
                    newArr.append(array[0].data[counter])
                }
                counter = counter + 1
            }
            updateCountLabel()
            
            if newArr.isEmpty == false{
                errorLabel2.isHidden = true
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Analytics.logEvent("on_studyVC", parameters: nil)
    }
    func updateCountLabel(){
        totalAddedLabel.text = "(" + String(newArr.count) + " Total)"
    }
    
    
    @IBOutlet weak var errorLabel2: UILabel!
    

    
    //Leave Review
//    override func viewDidAppear(_ animated: Bool) {
//        let deadline = DispatchTime.now() + .seconds(4)
//        DispatchQueue.main.asyncAfter(deadline: deadline) { [self] in
//            self.review.requestReview()
//        }
//
//    }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return newArr.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gemCell", for: indexPath) as! quizCell

            
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
    
    //Lock orientation
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        appUtility.lockOrientation(.portrait)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        appUtility.lockOrientation(.all)
    }

}


