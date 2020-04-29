//
//  reviewService.swift
//  99names
//
//  Created by Helal Chowdhury on 4/29/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import Foundation
import StoreKit

class reviewService {
    private init() {}
    static let shared = reviewService()
    
    func requestReview() {
        SKStoreReviewController.requestReview()
    }
}

