//
//  ExploreService.swift
//  airbnb
//
//  Created by 炜季 on 2024/8/13.
//

import Foundation

class ExploreService {
    
    func fetchListings() async throws -> [Listing] {
        return DevelopPreview.shared.listings
    }
}
